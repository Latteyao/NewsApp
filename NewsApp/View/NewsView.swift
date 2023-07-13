//
//  NewsView.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import SwiftUI



enum ArticlesState:Equatable {
    case loading(page:Int)
    case success(nextpage:Int?)
    case fail(retrypage:Int)
}


struct NewsView: View {
    @EnvironmentObject private var vm:NewsManager
    @AppStorage("country") private var country = countrys.tw.rawValue
    
    @State private var state:ArticlesState = .loading(page: 0)
    
    @State var error:Error? = nil
    @State var url:URL?
    @State var search:String = ""
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
                                        
                                        loadArticles(country: country,page: page)
                                        
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
//                .refreshable {
//                    loadArticles(country: country,page: 0)
//                }
                .onChange(of: country) { _ in
                    vm.reset()
                    state = .loading(page: 0)   //reset preview page
                } // change topheadline country reset
        }
    }
}


extension NewsView{
   private var title:some View{
       
       VStack{
//           TextField(" secrch...", text: $search)
//               .textFieldStyle(.roundedBorder)
//               .padding()
           HStack{
               Text("News")
                   .font(.largeTitle.bold())
                   .frame(maxWidth: .infinity,alignment: .leading)
               
               Button("button"){
               }
               
           }
           .padding()
           .frame(maxHeight: 45,alignment: .bottom)
           .background(Color(.brown))
       }
       .background(Color(.brown))
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
    
    func loadArticles(country:String,page:Int){
            
        Task{
           state = await vm.getTopheadline(country: country, page: page,pagesize: 5)
        }
        
        
    }
    
    func retry(retrypage:Int) ->some View{
        
            
            Button {
                state = .fail(retrypage: retrypage)
            } label: {
                Text("Please retry again...")
                Image(systemName: "arrow.clockwise")
            }

        
    }
    
    }



struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(NewsManager.preview)
    }
}
