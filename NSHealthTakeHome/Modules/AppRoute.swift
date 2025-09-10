//
//  AppRoute.swift
//  NSHealthTakeHome
//
//  Created by Praks on 09/09/2025.
//

import SwiftUI

enum AppRoute: Hashable {
    case home
    case labAndDiagnostics
    case recordsDetail(report: DiagnosticReportBundle)
}

// MARK: - Navigation Model
class NavigationModel: ObservableObject {
    @Published var path: [AppRoute] = []
    
    func goHome() {
        path = [.home]
    }
    
    func goToLabAndDiagnostics() {
        path = [.labAndDiagnostics]
    }
    
    func goToRecordsDetail(with report: DiagnosticReportBundle) {
        path.append(.recordsDetail(report: report))
    }
    
    func pop() {
        path.removeLast()
    }
}
