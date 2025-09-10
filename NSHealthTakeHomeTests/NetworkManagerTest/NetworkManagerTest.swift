//
//  NetworkManagerTest.swift
//  NSHealthTakeHomeTests
//
//  Created by Praks on 09/09/2025.
//
import Testing
import Foundation
@testable import NSHealthTakeHome

struct NetworkManagerTests {
    let request = URLRequest(url: URL(string: EndPoints.diagnosticreport)!)
    let mock = DiagnosticReportBundle.mock
    let mockSession = MockURLSession()
    
    @Test func testRequestSuccess() async throws {
        mockSession.data = try! JSONEncoder().encode(mock)
        mockSession.response = HTTPURLResponse(url: URL(string: EndPoints.diagnosticreport)!,
                                               statusCode: 200,
                                               httpVersion: nil,
                                               headerFields: nil)
        
        let networkManager = NetworkManager(session: mockSession)
        
        
        let result: DiagnosticReportBundle = try await networkManager.request(request, as: DiagnosticReportBundle.self)
        
        
        #expect(result == mock)
    }
    
    @Test func testRequestDecodingFailure() async {
        mockSession.data = Data("invalid json".utf8)
        mockSession.response = HTTPURLResponse(url: URL(string: EndPoints.diagnosticreport)!,
                                               statusCode: 200,
                                               httpVersion: nil,
                                               headerFields: nil)
        
        let networkManager = NetworkManager(session: mockSession)
        let request = URLRequest(url: URL(string: EndPoints.diagnosticreport)!)
        
        let error = DecodingError.dataCorrupted(.init(codingPath: [],
                  debugDescription: "The given data was not valid JSON.",
                  underlyingError: NSError(domain: NSCocoaErrorDomain, code: 3840,
                                           userInfo: [ NSDebugDescriptionErrorKey: "Unexpected character 'i' around line 1, column 1."]))
        ) as NSError
        
        await #expect(throws: NetworkError.decodingFailed(error)) {
            try await networkManager.request(request, as: DiagnosticReportBundle.self)
        }
        
    }
    
    
    @Test func testRequestUnexpectedStatusCode() async {
        mockSession.data = try! JSONEncoder().encode(mock)
        mockSession.response = HTTPURLResponse(url: URL(string: EndPoints.diagnosticreport)!,
                                               statusCode: 404,
                                               httpVersion: nil,
                                               headerFields: nil)
        
        let networkManager = NetworkManager(session: mockSession)
        let request = URLRequest(url: URL(string: EndPoints.diagnosticreport)!)
        
        await #expect(throws: NetworkError.unexpectedStatusCode(404)) {
            try await networkManager.request(request, as: DiagnosticReportBundle.self)
        }
    }
    
    @Test func testRequestNetworkFailure() async {
            let mockSession = MockURLSession()
            let requestFailedError = NSError(domain: "Network", code: 1)
            mockSession.error = requestFailedError
    
            let networkManager = NetworkManager(session: mockSession)
    
            await #expect(throws: NetworkError.requestFailed(requestFailedError)) {
                try await networkManager.request(request, as: DiagnosticReportBundle.self)
            }
        }
}

