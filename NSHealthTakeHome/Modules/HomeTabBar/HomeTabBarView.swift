//
//  HomeTabBarView.swift
//  NSHealthTakeHome
//
//  Created by Praks on 09/09/2025.
//

import SwiftUI

struct HomeTabBarView: View {
    @EnvironmentObject var nav: NavigationModel
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            homeTab
            recordsTab
        }
        .tint(.primaryApp)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
        }
        
    }
    
    var homeTab: some View {
        HomeView()
            .tabItem {
                VStack {
                    Image(selection == 0 ? .homeSelected : .home)
                        .renderingMode(.template)
                    Text(AppConstants.home)
                }
            }
            .tag(0)
    }
    
    var recordsTab: some View {
        let repo = LabAndDiagnosticsRepository(network: NetworkManager())
        let vm = LabAndDiagnosticsViewModel(repository: repo)
        
        return RecordsView(viewModel: vm)
            .environmentObject(nav)
            .tabItem {
                VStack {
                    Image(selection == 1 ? .recordsSelected : .records)
                        .renderingMode(.template)
                    Text(AppConstants.records)
                }
            }
            .tag(1)
    }
}
