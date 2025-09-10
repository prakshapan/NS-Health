//
//  DiagnosticObservation.swift
//  NSHealthTakeHome
//
//  Created by Praks on 09/09/2025.
//

import Foundation

struct DiagnosticObservation: Identifiable, Hashable, Equatable, Codable {
    var id = UUID()
    var title: String
    var observedValue: String
    var normalRange: String
}
