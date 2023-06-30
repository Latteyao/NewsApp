//
//  NewsManager.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import Foundation



final class NewsManager:ObservableObject{
    @Published private(set) var newsItme:[NewsItem] = []
    
    
    var getData: (Endpoint) async throws -> Data
    init(getData: @escaping (Endpoint) async throws -> Data){
        self.getData = getData
        
    } //endpoint
    
    
    static let share = {
        let config = URLSessionConfiguration.default
        var header = config.httpAdditionalHeaders ?? [:]
        header["X-Api-Key"] = ""
        config.httpAdditionalHeaders = header
        let session = URLSession(configuration: config)
        return NewsManager { try await session.data(for: $0.resquest) }
    }()  //設定
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
    
    
    func getArticle(endpoint:Endpoint) async -> [NewsItem] {

        do{
            let item:NewsItem = try await fetch(endpoint: endpoint)
            newsItme.append(item)
            return newsItme
        }catch{
            fatalError("❎    \(error.localizedDescription)")
        }
            
    }
    
}

//MARK: -Endpoint
    extension NewsManager{
        enum Endpoint{
            case everything(keyword:String = "apple"), topheadline(country:String = "tw")
            
            var resquest:URLRequest{
                switch self{
                case .everything(let keyword):
                    return URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=\(keyword)&pagesize=1")!)
                case .topheadline(let country):
                    return URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=\(country)&pagesize=1")!)
                }
            }
        }
    }




   
