//
//  NewsManager.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import Foundation

@MainActor
final class NewsManager:ObservableObject{
    
    @Published private(set) var newsItme:[NewsItem] = []
    @Published private(set) var article:[Article] = []
    
    var getData: (Endpoint) async throws -> Data
    init(getData: @escaping (Endpoint) async throws -> Data){
        self.getData = getData
        
        
    } //endpoint
    
    
    static let share = {
        let config = URLSessionConfiguration.default
        var header = config.httpAdditionalHeaders ?? [:]
        header["X-Api-Key"] = MyApiKey.apikey
        config.httpAdditionalHeaders = header
        let session = URLSession(configuration: config)
        return NewsManager { try await session.data(for: $0.resquest) }
    }()  //setup URLSession singleton
    
    static let preview = NewsManager{
        try await Task.sleep(for: .seconds(2))
        return $0.stub
    } 
}

extension NewsManager{
    
    
    func fetch<T:Decodable>(endpoint:Endpoint) async throws -> T{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let data = try await getData(endpoint)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return try decoder.decode(T.self, from: data)
    }
    
    
    func getTopheadline(country:String,category: String = "general",page:Int,pagesize:Int = 20) async -> ArticlesState {
        
        do{
            let item:NewsItem = try await fetch(endpoint: .topheadline(country: country,category: category,page: page, pagesize: pagesize))
            guard !item.articles.isEmpty else{
                return .fail(retrypage: page)
            }
            article.append(contentsOf: item.articles)
            let isLastPage = article.count < pagesize
            return .success(nextpage: isLastPage ? nil : page + 1)
        }catch{
            
            print("❎    \(error.localizedDescription)")
            return .fail(retrypage: page)
        }
            
    }
    
    func reset() {
        newsItme = []
        article = []
    }
    
}



enum ArticlesState:Equatable {
    case loading(page:Int)
    case success(nextpage:Int?)
    case fail(retrypage:Int)
}




//MARK: -Endpoint
    extension NewsManager{
        enum Endpoint{
            case everything(keyword:String = "apple"), topheadline(country:String,category:String = "general",page:Int,pagesize:Int)
            
            var resquest:URLRequest{
                switch self{
                case .everything(let keyword):
                    return URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=\(keyword)&pagesize=10")!)
                case .topheadline(let country,let category,let page,let pagesize):
                    return URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=\(country)&category=\(category)&page=\(page)&pagesize=\(pagesize)")!)
                }
            }
        }
        
        
        
    }




   
