//
//  SearchView.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/7/28.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(\.dismiss) private var dismiss
    @FocusState var isfocused:Bool
    @State private var state:NewsManager.ArticlesState = .loading(page: 0) // article state
    @State var search = ""
    @State var url:URL?
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .font(.largeTitle)
                            .padding()
                    }
                    
                    TextField("Search...", text: $search)
                        .focused($isfocused) // default focus
                        .keyboardType(.default)
                }
                
                ScrollView {
                    NewsView.mainView
                    Text("這裡")
                   
                }
            }
        }.navigationBarBackButtonHidden(true)
           
            .onAppear{
                isfocused = true
            }
            
    }
}
extension SearchView{
    func back(){
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
