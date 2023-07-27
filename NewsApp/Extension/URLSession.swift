//
//  URLSession.swift
//  NewsApp
//
//  Created by MacBook Pro on 2023/6/20.
//

import Foundation


extension URLSession{
    
    enum APIError:Error{
        case invalidURL
        case invalidCode(Int)
    }
    
    
    func data(for urlRequest: URLRequest) async throws -> Data{
        let (data, respones) = try await self.data(for: urlRequest)
        guard let respones = respones as? HTTPURLResponse else { throw APIError.invalidURL }
        guard  200...299 ~= respones.statusCode else { throw APIError.invalidCode(respones.statusCode) }
        return data
    }
}


