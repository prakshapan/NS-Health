//
//  ContentView.swift
//  NSHealthTakeHome
//
//  Created by Praks on 09/09/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var nav: NavigationModel
    
    var body: some View {
        VStack() {
            AppNavigationTitleView(title: AppConstants.home)
            
            Text(AppConstants.Home.demoApp)
                .font(AppFont.boldTitle)
                .padding()
            
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
    }
}
