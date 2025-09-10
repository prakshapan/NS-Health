//
//  ContentView.swift
//  NSHealthTakeHome
//
//  Created by Praks on 09/09/2025.
//

import SwiftUI

struct RootView: View {
    @StateObject private var nav = NavigationModel()
    
    var body: some View {
        NavigationStack(path: $nav.path) {
            HomeTabBarView()
                .environmentObject(nav)
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .home:
                        HomeTabBarView().environmentObject(nav)
                    case .labAndDiagnostics:
                        let repo = LabAndDiagnosticsRepository(network: NetworkManager(jsonDecoder: AppDecoders.jsonDecoderWithDates))
                        let vm = LabAndDiagnosticsViewModel(repository: repo)
                                    
                        LabAndDiagnosticsView(viewModel: vm).environmentObject(nav)
                    case .recordsDetail(let report):
                        RecordDetailsView(reportBundle: report).environmentObject(nav)
                    }
                }
        }
    }
}
