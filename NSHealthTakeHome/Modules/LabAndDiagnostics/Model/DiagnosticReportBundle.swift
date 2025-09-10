//
//  Model.swift
//  NSHealthTakeHome
//
//  Created by Praks on 06/09/2025.
//

import Foundation

struct DiagnosticReportBundle: Codable {
    fileprivate let resourceType: ResourceType
    let id: String
    fileprivate let type: String
    fileprivate let entry: [Entry]

    static let mock = Self(resourceType: .diagnosticReport,
                           id: "1", type: "", entry: [])
}

extension DiagnosticReportBundle: Identifiable, Hashable {
    static func ==(lhs: DiagnosticReportBundle, rhs: DiagnosticReportBundle) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension DiagnosticReportBundle {
    var observations: [DiagnosticObservation] {
        entry
            .filter { $0.resource.resourceType == .observation }
            .map { DiagnosticObservation(title: $0.resource.resourceTitle,
                               observedValue: $0.resource.observedValue,
                               normalRange: $0.resource.normalRange) }
    }
    
    private var diagnosticReport: Resource? {
        entry
            .map { $0.resource }
            .first { $0.resourceType == .diagnosticReport }
    }
    
    var recordTitle: String {
        diagnosticReport?.code?.text ?? AppConstants.NoValue.unknownReport
    }
    
    var performedBy: String {
        diagnosticReport?.performer?.first?.display ?? AppConstants.NoValue.unknownPerformer
    }
    
    var effectiveDate: Date? { diagnosticReport?.effectiveDateTime }
    
}
// MARK: - Entry
struct Entry: Codable {
    fileprivate let fullUrl: String
    fileprivate let resource: Resource
}

// MARK: - Resource
struct Resource: Codable {
    fileprivate let resourceType: ResourceType
    fileprivate let id: String
    fileprivate let status: String?
    fileprivate let code: Code?
    fileprivate let effectiveDateTime: Date?
    fileprivate let performer: [Performer]?
    fileprivate let result: [Result]?
    fileprivate let valueQuantity: ValueQuantity?
    fileprivate let referenceRange: [ReferenceRange]?
}

extension Resource {
    var resourceTitle: String { return code?.text ?? "" }
    var observedValue: String {
        guard let quantity = valueQuantity else { return AppConstants.NoValue.noValue }
        return "\(quantity.value) \(quantity.unit)"
    }
    
    var normalRange: String {
        guard
            let range = referenceRange?.first,
            let low = range.low,
            let high = range.high
        else { return AppConstants.NoValue.noNormalRange }
        
        return "\(low.value) - \(high.value) \(high.unit)"
    }
}

// MARK: - ResourceType Enum
enum ResourceType: String, Codable {
    case bundle = "Bundle"
    case observation = "Observation"
    case diagnosticReport = "DiagnosticReport"
    case unknown
}

// Custom decoding with fallback to .unknown
extension ResourceType {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let raw = try container.decode(String.self)
        self = ResourceType(rawValue: raw) ?? .unknown
    }
}

// MARK: - Code
struct Code: Codable {
    fileprivate let text: String
}

// MARK: - Performer
struct Performer: Codable {
    fileprivate let display: String
}

// MARK: - ReferenceRange
struct ReferenceRange: Codable {
    fileprivate let low, high: ValueQuantity?
}

// MARK: - ValueQuantity
struct ValueQuantity: Codable {
    fileprivate let value: Double
    fileprivate let unit: String
    fileprivate let system: String?
    fileprivate let code: String?
}

// MARK: - Result
struct Result: Codable {
    fileprivate let reference: String
}
