//
//  APIManager+Endpoint.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/9/20.
//

import Foundation

// MARK: - Endpoint

extension APIManager {
  /// Endpoint
  /// - resquest: get API data
  /// - stub: local data
  enum Endpoint {
    case everything(keyword: String = "apple"), topheadline(country: String, category: String = "general", page: Int, pagesize: Int)
    var resquest: URLRequest {
      switch self {
      case .everything(let keyword):
        return URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=\(keyword)&pagesize=10")!)
      case .topheadline(let country, let category, let page, let pagesize):
        return URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=\(country)&category=\(category)&page=\(page)&pagesize=\(pagesize)")!)
      }
    }
  }
}
