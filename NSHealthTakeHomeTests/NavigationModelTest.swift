//
//  Test.swift
//  NSHealthTakeHomeTests
//
//  Created by Praks on 09/09/2025.
//

import Testing
@testable import NSHealthTakeHome

struct NavigationModelTest {
    let sut = NavigationModel()
    
    @Test func testGoHome() {
        sut.goHome()
        #expect(sut.path == [.home] )
    }
    
    @Test func testGoToDetail() {
        sut.goToLabAndDiagnostics()
        #expect(sut.path == [.labAndDiagnostics] )
    }
    
    @Test func testGoToRecordsDetail() {
        let reportBundleMock = DiagnosticReportBundle.mock
        sut.goToRecordsDetail(with: reportBundleMock)
        #expect(sut.path.last == .recordsDetail(report: reportBundleMock))
        
    }
    
    @Test func testPop() {
        sut.goHome()
        let reportBundleMock = DiagnosticReportBundle.mock
        sut.goToRecordsDetail(with: reportBundleMock)
        
        #expect(sut.path.count == 2)
        sut.pop()
        #expect(sut.path.count == 1)
        
        sut.pop()
        #expect(sut.path.count == 0)
        
    }

}
