//
//  SettingView.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import SwiftUI


enum countrys:String,Identifiable,CaseIterable,View{
    
    var id: String { self.rawValue }
    var body: some View { Text(self.rawValue) }
    
    case tw
    case us
}

struct SettingView: View {
    @AppStorage("country") var country:String = countrys.tw.rawValue
    
    
    var body: some View {
        Form {
            Section("基本設定") {
                
                
                Picker(selection: $country) {
                    ForEach(countrys.allCases) { $0 }
                } label: {
                    Label("國家", systemImage: "globe")
                }

                    
            }
        }
        
    }
    
    
}


extension SettingView{
    
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
