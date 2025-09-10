//
//  NetworkError.swift
//  NSHealthTakeHome
//
//  Created by Praks on 09/09/2025.
//

import Foundation

enum NetworkError: Error, Equatable {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    case unexpectedStatusCode(Int)
    
    static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case let (.unexpectedStatusCode(a), .unexpectedStatusCode(b)):
            return a == b
        case let (.requestFailed(a), .requestFailed(b)):
            return a.localizedDescription == b.localizedDescription
        case let (.decodingFailed(a), .decodingFailed(b)):
            return a.localizedDescription == b.localizedDescription
        default:
            return true
        }
    }
}
