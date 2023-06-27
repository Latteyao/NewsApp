//
//  URLSession.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import Foundation


extension URLSession{
    func data(for urlRequest: URLRequest) async throws -> Data{
        let (data, respones) = try await self.data(for: urlRequest)
        guard let respones = respones as? HTTPURLResponse else { fatalError("respones error") } //MARK: Error fix
        guard  200...299 ~= respones.statusCode else { fatalError("statusCode error") } //MARK: Error fix
        return data
    }
}
