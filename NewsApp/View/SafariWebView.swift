//
//  SafariWebView.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/7/4.
//

import SwiftUI
import SafariServices

struct SafariWebView:UIViewControllerRepresentable{
    
    
    let url:URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return SFSafariViewController(url: url)
    }
    
    
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
