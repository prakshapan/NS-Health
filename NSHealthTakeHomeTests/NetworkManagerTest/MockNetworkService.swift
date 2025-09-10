//
//  MockNetworkService.swift
//  NSHealthTakeHome
//
//  Created by Praks on 09/09/2025.
//

import Testing
import Foundation
@testable import NSHealthTakeHome

final class MockNetworkService: NetworkService {
    var shouldThrowError = false
    var mockData: DiagnosticReportBundle = DiagnosticReportBundle.mock
    
    func request<T>(_ request: URLRequest, as type: T.Type) async throws -> T where T : Decodable {
        if shouldThrowError {
            throw NetworkError.invalidURL // Or any error you want to test
        }
        guard let data = mockData as? T else {
            let decodingError = NSError(domain: "Decode Error", code: 456, userInfo: nil)
            throw NetworkError.decodingFailed(decodingError)
        }
        return data
    }
}
