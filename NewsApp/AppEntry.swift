//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/15.
//

import SwiftUI

@main
struct AppEntry: App {
    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(NewsManager.preview)
        }
    }
}
