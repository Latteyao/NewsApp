//
//  NewsManager+State.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/7/27.
//

import Foundation



extension ArticleViewModel {
  /// API fetch articles the  state
  enum ArticlesState: Equatable {
    case loading(page: Int)
    case success(nextpage: Int?)
    case fail(retrypage: Int)
  }
}
