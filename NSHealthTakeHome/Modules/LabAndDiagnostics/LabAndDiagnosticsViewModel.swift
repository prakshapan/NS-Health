//
//  RecordsViewModel.swift
//  NSHealthTakeHome
//
//  Created by Praks on 08/09/2025.
//


import SwiftUI

@MainActor
final class LabAndDiagnosticsViewModel: ObservableObject {
    @Published var state: ViewState<[DiagnosticReportBundle]> = .idle
    
    private let repository: LabAndDiagnosticsRepositoryProtocol

    init(repository: LabAndDiagnosticsRepositoryProtocol) {
        self.repository = repository
    }

    func loadDiagnosticReport() async {
        state = .loading
        do {
            // try await Task.sleep(for: .seconds(3))
            let report = try await repository.fetchDiagnosticReport()
            state = .success(data: [report])
        } catch {
            state = .failure(message: error.localizedDescription)
        }
    }
}


