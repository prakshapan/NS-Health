//
//  AppNavigation.swift
//  NSHealthTakeHome
//
//  Created by Praks on 08/09/2025.
//

import SwiftUI

struct AppNavigation: ViewModifier {
    @EnvironmentObject var nav: NavigationModel
    var title: String
    
    func body(content: Content) -> some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.hidden, for: .navigationBar) 
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { nav.pop() }) { AppViews.backIcon }
                }
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(AppFont.boldTitle3)
                        .foregroundColor(.white)
                }
            }
            .overlay(alignment: .top) {
                UnevenRoundedRectangle(cornerRadii: .init(bottomTrailing: AppDimensions.navCornerRadius))
                    .fill(.primaryApp)
                    .frame(height: AppDimensions.navBarHeight)
                    .ignoresSafeArea(edges: .top)
            }
            .navigationBarBackButtonHidden()
    }
}

extension View {
    func appNavigation(_ title: String) -> some View {
        modifier(AppNavigation(title: title))
    }
}
