//
//  NewsItem.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import Foundation




// MARK: - NewItem
struct NewsItem: Codable {
    let status:String
    let totalResults:Int
    let articles:[Article]
}

// MARK: - Article

struct Article: Codable {
    let source: Source
    let author: String?
    let title:String?
    let description: String?
    let url:String
    let urlToImage:String?
    let publishedAt:Date
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id:String?
    let name:String?
}





