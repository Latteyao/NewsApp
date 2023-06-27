//
//  ContentView.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/15.
//

import SwiftUI

struct HomeScreen: View {
    @State var tab:Tab = .news
    var body: some View {
        NavigationStack{
            TabView(selection: $tab) {
                ForEach(Tab.allCases, id: \.self){ $0 }
            }
        }
        
    }
}


extension HomeScreen{
    
    enum Tab: String,View,CaseIterable{
        case news, setting
        var body: some View { content.tabItem{ tool.labelStyle(.iconOnly)} }
    
    
    @ViewBuilder
    private var content:some View{
        switch self{
        case .news: NewsView()
        case .setting: SettingView()
        }
    }
    @ViewBuilder
    private var tool: some View{
            switch self{
            case .news:
                Label("news", systemImage: "newspaper.fill")
            case .setting:
                Label("setting", systemImage: "gearshape")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
