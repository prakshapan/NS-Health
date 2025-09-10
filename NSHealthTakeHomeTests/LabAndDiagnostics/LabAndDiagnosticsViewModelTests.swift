//
//  LabAndDiagnosticsViewModelTests.swift
//  NSHealthTakeHome
//
//  Created by Praks on 09/09/2025.
//

import Testing
import Foundation
@testable import NSHealthTakeHome

@MainActor
struct LabAndDiagnosticsViewModelTests {
    
    @Test func testLoadDiagnosticReportSuccess() async {
        
        let mockRepo = MockLabAndDiagnosticsRepository()
        let viewModel = LabAndDiagnosticsViewModel(repository: mockRepo)
        
        
        await viewModel.loadDiagnosticReport()
        
        
        
        
        switch viewModel.state {
        case .success(let data):
            #expect(data.count == 1)
            #expect(data.first == mockRepo.mockReport)
        default:
            Issue.record("Expected success state, got \(viewModel.state) instead")
        }
    }
    
    @Test func testLoadDiagnosticReportFailure() async {
        
        let mockRepo = MockLabAndDiagnosticsRepository()
        mockRepo.shouldThrowError = true
        let viewModel = LabAndDiagnosticsViewModel(repository: mockRepo)
        
        
        await viewModel.loadDiagnosticReport()
        
        
        switch viewModel.state {
        case .failure(let errorMessage):
            #expect(!errorMessage.isEmpty)
        default:
            Issue.record("Expected failure state, got \(viewModel.state) instead")
        }
    }
}
