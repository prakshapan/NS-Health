//
//  ViewState.swift
//  NSHealthTakeHome
//
//  Created by Praks on 08/09/2025.
//

import Foundation
enum ViewState<T>: Equatable where T: Equatable {
    case idle
    case loading
    case success(data: T)
    case failure(message: String)

    static func == (lhs: ViewState<T>, rhs: ViewState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading):
            return true
        case let (.success(a), .success(b)):
            return a == b
        case let (.failure(msg1), .failure(msg2)):
            return msg1 == msg2
        default:
            return false
        }
    }
}
