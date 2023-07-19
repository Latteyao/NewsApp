//
//  NewsView.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import SwiftUI

    struct NewsView: View {
        @EnvironmentObject private var vm:NewsManager
        @AppStorage("country") private var country = countrys.tw.rawValue
        @State var category:Category = .general
        @State private var state:ArticlesState = .loading(page: 0)
        @State var error:Error? = nil
        @State var url:URL?
        
        var body: some View {
            
            VStack {
                title
                
                ScrollView {
                    LazyVStack{
                        mainView
                        
                        Group{
                            switch state {
                            case .loading(let page):
                                ProgressView()
                                    .controlSize(.large)
                                    .onAppear{
                                        
                                        loadArticles(country: country, category: category.rawValue,page: page)
                                        
                                    }
                            case .success(let nextpage?):
                                ProgressView()
                                    .onAppear{
                                        
                                        state = .loading(page: nextpage)
                                        
                                    }
                            case .fail(let retrypage):
                                retry(retrypage: retrypage)
                            default:
                                EmptyView()
                            }
                        }.frame(minHeight: 100)
                    }
                }
                .onChange(of: country) { _ in
                    vm.reset()
                    state = .loading(page: 0)   //reset preview page
                } // change topheadline country reset
                .onChange(of: category) { _ in
                    vm.reset()
                    state = .loading(page: 0)
                }
            }
        }
    }
    
    
    extension NewsView{
        
        
        private var title:some View{
            VStack{
                ScrollView(.horizontal){
                    HStack{
                        ForEach(Category.allCases,id: \.self){ string in
                            
                            Button {
                                withAnimation {
                                    category = string
                                }
                            } label: {
                                Text(string.rawValue)
                                    .bold()
                                    .font(.callout)
                                    .opacity(category == string ? 1 : 0.5)
                                
                            }.foregroundColor(category == string ? .black : .white)
                            .padding()
                            
                        }
                        
                    }
                    
                }.scrollIndicators(.hidden)
                    .background(Color(.brown))
            }
        }
        
        private var mainView:some View{
            ForEach(vm.article) {  articles in
                VStack(alignment:.trailing){
                    
                    HStack{
                        Button {
                            url = URL(string:articles.url) ?? nil
                        } label: {
                            AsyncImage(url: URL(string: articles.urlToImage ?? "")) { image in
                                image.resizable()
                                    .frame(maxWidth: 125,maxHeight:100)
                            } placeholder: {
                                Color.white
                            }
                            
                            VStack{
                                Text("\(articles.title)\n")
                                Spacer()
                                
                            }.font(.system(size: 15).bold())
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                            
                        }.fullScreenCover(item: $url, content: { url in
                            SafariWebView(url: url)
                                .ignoresSafeArea()
                        })
                        
                        
                    }
                    Text(articles.publishedAt.formatted(date: .complete, time: .omitted))
                        .font(.caption2)
                        .opacity(0.4)
                    Divider()
                        
                }
            }.padding()
        }
        
    }


//MARK: -- func
extension NewsView{
    
    func loadArticles(country:String,category:String,page:Int){
            
        Task{
            state = await vm.getTopheadline(country: country, category: category, page: page,pagesize: 5)
        }
        
        
    }
    
    func retry(retrypage:Int) ->some View{
        
        HStack{
            Text("Please retry again...")
            Button {
                state = .fail(retrypage: retrypage)
            } label: {
                Image(systemName: "arrow.clockwise")
            }
            
        }
    }
    
    }


extension NewsView{
    
    enum Category:String,CaseIterable,Equatable{
        case general
        case business
        case entertainment
        case health
        case science
        case sports
        case technology
    }
        
    
}



struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(NewsManager.preview)
    }
}
