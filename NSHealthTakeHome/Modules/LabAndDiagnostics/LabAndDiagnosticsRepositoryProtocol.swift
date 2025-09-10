//
//  LabAndDiagnosticsRepository.swift
//  NSHealthTakeHome
//
//  Created by Praks on 09/09/2025.
//

import Foundation

protocol LabAndDiagnosticsRepositoryProtocol {
    func fetchDiagnosticReport() async throws -> DiagnosticReportBundle
}

final class LabAndDiagnosticsRepository: LabAndDiagnosticsRepositoryProtocol {
    private let network: NetworkService
    
    init(network: NetworkService) {
        self.network = network
    }
    
    func fetchDiagnosticReport() async throws -> DiagnosticReportBundle {
        guard let url = URL(string: EndPoints.diagnosticreport) else {
            throw NetworkError.invalidURL
        }
        let request = URLRequest(url: url)
        return try await network.request(request, as: DiagnosticReportBundle.self)
    }
}
