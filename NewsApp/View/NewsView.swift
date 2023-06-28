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
        
        VStack {
                Text("News")
                .font(.largeTitle.bold())
                .padding()
                
            
            ScrollView {
                Text("aaaa")
                
            }
            
        }
        
    }
}

extension NewsItem{
   
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(NewsManager.share)
    }
}
