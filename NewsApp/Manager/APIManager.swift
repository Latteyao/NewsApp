//
//  NewsManager.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import Foundation

final class APIManager {
  var getData: (Endpoint) async throws -> Data
  init(getData: @escaping (Endpoint) async throws -> Data) {
    self.getData = getData
  } // switch Endpoint and get Data

  /// setup URLSession singleton
  static let share = {
    let config = URLSessionConfiguration.default
    var header = config.httpAdditionalHeaders ?? [:]
    header["X-Api-Key"] = MyApiKey.apikey
    config.httpAdditionalHeaders = header
    let session = URLSession(configuration: config)
    return APIManager { try await session.data(for: $0.resquest) }
  }()

  /// location data
  static let preview = APIManager {
    try await Task.sleep(for: .seconds(2))
    return $0.stub
  }
}

// MARK: - - Sub

extension APIManager {
  /// decoder data and formatter date
  func fetch<T: Decodable>(endpoint: Endpoint) async throws -> T {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
    let data = try await getData(endpoint)
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    return try decoder.decode(T.self, from: data)
  }
}
