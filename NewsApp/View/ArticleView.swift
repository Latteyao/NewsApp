//
//  ArticleView.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import SwiftUI

struct ArticleView: View {
    
    @EnvironmentObject private var vm:NewsManager
    var body: some View {
            VStack{
                if !vm.newsItme.isEmpty{
                    
                }else{
                   
                }
                Text(vm.newsItme.first?.articles.first?.title ?? "").font(.largeTitle.bold())
                AsyncImage(url: URL(string: vm.newsItme.first?.articles.first?.urlToImage ?? ""),scale: 3.0)
                Spacer()
                Text(vm.newsItme.first?.articles.first?.content ?? "")

        }
    }
}



struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView()
            .environmentObject(NewsManager.init(getData: \.stub))
    }
}
