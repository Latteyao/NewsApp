//
//  URL.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/7/5.
//

import Foundation
import SwiftUI


extension URL:Identifiable{
    public var id:String{
        self.absoluteString
    }
}


extension ScrollView{
    @MainActor  func mainView(in viewModel:NewsManager,url:URL?,item: Binding<url>) -> some View {
        
        ForEach(viewModel.article) {  articles in
            
            VStack(alignment:.trailing){
                
                HStack{
                    Button {
                        url = URL(string:articles.url) ?? nil // get article url
                    } label: {
                        if articles.urlToImage != nil{
                            AsyncImage(url: URL(string: articles.urlToImage ?? "")) { image in
                                image.resizable()
                                    .frame(maxWidth: 125,maxHeight:100)
                            } placeholder: {
                                Color.white
                            }
                        } else {
                            Image("no image")
                                .resizable()
                                .frame(width: 130,height: 130)
                                .opacity(0.5)
                        }  // display article image
                        
                        VStack{
                            Text("\(articles.title)\n") // article title
                            Spacer()
                            
                        }.font(.system(size: 15).bold())
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                        
                    }.fullScreenCover(item: item, content: { url in
                        SafariWebView(url: url as! URL)  // show article page
                            .ignoresSafeArea()
                    })
                    
                    
                }
                Text(articles.publishedAt.formatted(date: .complete, time: .omitted))  // article date
                    .font(.caption2)
                    .opacity(0.4)
                Divider()
            }
        }.padding()
    }
    
}
