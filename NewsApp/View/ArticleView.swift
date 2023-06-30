//
//  ArticleView.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import SwiftUI

struct ArticleView: View {
    @EnvironmentObject private var vm:NewsManager
    @State var newsItem:[NewsItem] = []
    var body: some View {
        NavigationView{
            HStack{
                Text("aa")
            }
        }
    }
}



struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
            .environmentObject(NewsManager.init(getData: \.stub))
    }
}
