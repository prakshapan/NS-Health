//
//  ErrorView.swift
//  NSHealthTakeHome
//
//  Created by Praks on 08/09/2025.
//

import SwiftUI
struct ErrorView: View {
    var error: String
    
    var body: some View {
        VStack() {
            Spacer()
            Text(error)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}
