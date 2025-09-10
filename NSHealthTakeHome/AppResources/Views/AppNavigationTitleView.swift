//
//  AppNavigationTitleView.swift
//  NSHealthTakeHome
//
//  Created by Praks on 08/09/2025.
//

import SwiftUI
struct AppNavigationTitleView: View {
    var title: String
    
    var body: some View {
        VStack(spacing: 0){
            Spacer()
            HStack() {
                Text(title)
                    .font(AppFont.boldTitle)
                    .padding([.bottom, .leading])
                Spacer()
            }
        }
        .foregroundColor(.white)
        .frame(height: AppDimensions.navBarHeight)
        .frame(maxWidth: .infinity)
        .background(
            UnevenRoundedRectangle(cornerRadii: .init(bottomTrailing: AppDimensions.navCornerRadius))
                .fill(.primaryApp))
        
    }
}
