//
//  LabDiagnosticsViewModelTests.swift
//  NSHealthTakeHomeTests
//
//  Created by Praks on 09/09/2025.
//

import Testing
import Foundation
@testable import NSHealthTakeHome

struct LabAndDiagnosticsRepositoryTests {
    
    @Test func testFetchDiagnosticReportSuccess() async throws {
        
        let mockNetwork = MockNetworkService()
        let repository = LabAndDiagnosticsRepository(network: mockNetwork)
        
        let result = try await repository.fetchDiagnosticReport()
        
        #expect(result == mockNetwork.mockData)
    }
    
    @Test func testFetchDiagnosticReportFailure() async {
        
        let mockNetwork = MockNetworkService()
        mockNetwork.shouldThrowError = true
        let repository = LabAndDiagnosticsRepository(network: mockNetwork)
        
        await #expect(throws: NetworkError.invalidURL) {
            try await repository.fetchDiagnosticReport()
        }
    }
}



