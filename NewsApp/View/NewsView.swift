//
//  NewsView.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import SwiftUI

struct NewsView: View {
    @EnvironmentObject private var vm:NewsManager
    @AppStorage("country") private var country = countrys.us.rawValue
    @State var category:Category = .general // article category
    @State private var state:NewsManager.ArticlesState = .loading(page: 0) // article state
    @State var error:Error? = nil
    @State var url:URL?
    @State var searchtext:String = ""
    @State var istab:Bool = false
    
    var body: some View {
        NavigationStack{
            VStack {
                categorybar
                ScrollView {
                    LazyVStack{
                        mainView
                        
                        articlesState
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
}
    
//MARK: -- SubView
    extension NewsView {

        
        
        private var categorybar:some View{
            
            VStack{
                
                    NavigationLink {
                        SearchView()
                    } label: {
                        TextField("search...", text: $searchtext)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                    }
                
                
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
                
            }
            .background(Color(.brown))
        }
        
         var mainView:some View{
            ForEach(vm.article) {  articles in
                
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
                            
                        }.fullScreenCover(item: $url, content: { url in
                            SafariWebView(url: url)  // show article page
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
        
        
        private var articlesState: some View {
            
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
                        .controlSize(.large)
                        .onAppear{
                            state = .loading(page: nextpage)
                        }
                    
                case .fail(let retrypage):
                    retry(retrypage: retrypage)
                    
                default:
                    EmptyView()
                    
                } // article state
            }.frame(minHeight: 100)
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


