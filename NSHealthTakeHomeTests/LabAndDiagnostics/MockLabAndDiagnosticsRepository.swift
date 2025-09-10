//
//  MockLabAndDiagnosticsRepository.swift
//  NSHealthTakeHome
//
//  Created by Praks on 09/09/2025.
//


import Testing
import Foundation
@testable import NSHealthTakeHome

// MARK: - Mock Repository
final class MockLabAndDiagnosticsRepository: LabAndDiagnosticsRepositoryProtocol {
    var shouldThrowError = false
    var mockReport: DiagnosticReportBundle = DiagnosticReportBundle.mock
    
    func fetchDiagnosticReport() async throws -> DiagnosticReportBundle {
        if shouldThrowError {
            throw NSError(domain: "TestError", code: 1)
        }
        return mockReport
    }
}

// MARK: - ViewModel Unit Tests

