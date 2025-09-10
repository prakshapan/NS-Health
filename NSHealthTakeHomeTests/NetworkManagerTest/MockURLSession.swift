//
//  MockURLSession.swift
//  NSHealthTakeHome
//
//  Created by Praks on 09/09/2025.
//


import Testing
import Foundation
@testable import NSHealthTakeHome

final class MockURLSession: URLSessionProtocol {
    var data: Data?
    var response: URLResponse?
    var error: Error?
    
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        guard let data = data, let response = response else {
            throw NetworkError.invalidResponse
        }
        return (data, response)
    }
}