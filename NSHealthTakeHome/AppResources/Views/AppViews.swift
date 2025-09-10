//
//  AppViews.swift
//  NSHealthTakeHome
//
//  Created by Praks on 07/09/2025.
//

import SwiftUI
struct AppViews {
    static let rectangleWithShadow: some View = RoundedRectangle(cornerRadius: AppDimensions.listCornerRadius)
        .fill(.background)
        .shadow(color: .gray, radius: 2, x: 0, y: 1)
    
    static let endOfResults: some View = Text(AppConstants.Records.endOfResults)
        .font(AppFont.regularBody)
        .foregroundColor(.gray)
        .background(.clear)
    
    static let backIcon: some View = Image(systemName: AppImageConstants.back)
        .resizable()
        .frame(width: 15, height: 15)
        .foregroundColor(.white)
}
