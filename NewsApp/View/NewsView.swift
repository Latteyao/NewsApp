//
//  NewsView.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject private var vm:NewsManager
    @State private var newsItme:[NewsItem] = []
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
        
            VStack{
                HStack{
                    NavigationLink {
                        ArticleView()
                    } label: {
                        if !vm.newsItme.isEmpty{
                            AsyncImage(url: URL(string: vm.newsItme.first!.articles.first!.urlToImage ?? ""),scale: 8.0)
                            
                            
                            
                            Text("\(vm.newsItme.first!.articles.first!.title ?? "")\n")
                                .font(.footnote)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity,alignment: .leading)
                        }else{
                            ProgressView()
                        }
                    }

                    
                }
                
            }.padding()
                .frame(maxWidth: .infinity)
                .onAppear{ loadArticles() }
                
        }
    
    
    func loadArticles(){
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
