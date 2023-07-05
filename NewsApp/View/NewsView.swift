//
//  NewsView.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject private var vm:NewsManager
    
    @State var isLoading:Bool = false
    @State var error:Error? = nil
    @State var url:URL?
    var body: some View {
        NavigationView{
            VStack {
                
                title
                
                ScrollView {
                    mainView()
                }
            }
        }
    }
}


extension NewsView{
   private var title:some View{
        
        ZStack{
            HStack{
                Text("News")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity,alignment: .leading)
                
                Button("button"){
                }
                
            }.padding()
            .background(Color(.brown))
        }
        
    }
    
    func mainView() -> some View{
        
            
        
        VStack(spacing:20){
                
                    
                
                    if !vm.newsItme.isEmpty{
                        
                        
                        ForEach(vm.newsItme.first!.articles) {  articles in
                            VStack(alignment:.trailing){
                                
                                HStack{
                                    Button {
                                        url = URL(string:articles.url) ?? nil
                                    } label: {
                                        AsyncImage(url: URL(string: articles.urlToImage ?? ""),scale: 15.0)
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
                
            
        }.padding()
            .frame(maxWidth: .infinity)
            .task {
                loadArticles()
            }
            
    }
    
   @MainActor func loadArticles(){
        Task{
             await vm.getArticle(endpoint: .everything())
        }
    }
    
    }



struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(NewsManager.share)
    }
}
