//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/9/23.
//

import SwiftUI

@MainActor
class ArticleViewModel: ObservableObject {
  @Published private(set) var newsItme: [NewsItem] = []
  @Published private(set) var article: [Article] = []
  
  var apiManager: APIManager = .share
  static let instance = ArticleViewModel()
}

extension ArticleViewModel {
  /// Fetch topheadline articles and return ArticlesState
  func getTopheadline(country: String, category: String = "general", page: Int, pagesize: Int = 20) async -> ArticlesState {
    do {
      let item: NewsItem = try await apiManager.fetch(endpoint: .topheadline(country: country, category: category, page: page, pagesize: pagesize))
      guard !item.articles.isEmpty else {
        return .fail(retrypage: page)
      }
      article.append(contentsOf: item.articles)
      let isLastPage = article.count < pagesize
      return .success(nextpage: isLastPage ? nil : page + 1)
    } catch {
      print("❎    \(error.localizedDescription)")
      return .fail(retrypage: page)
    }
  }
  
  /// update view and reset data
  func reset() {
    newsItme = []
    article = []
  }
}
  
