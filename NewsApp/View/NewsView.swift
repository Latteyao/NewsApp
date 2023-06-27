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
        ScrollView{
            VStack{
                HStack{
                    Text("News")
                        .font(.title)
                        .bold()
                        .frame(alignment: .topLeading)
                    Spacer()

                    
                }.padding()
            }.padding()
            
            
            
            
                VStack{
                }.font(.largeTitle)
                    .frame(maxWidth: .infinity,alignment: .center)
        }
    }
}

extension NewsItem{
   
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            
          
    }
}
