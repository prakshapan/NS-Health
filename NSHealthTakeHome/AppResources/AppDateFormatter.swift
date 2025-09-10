//
//  AppDateFormatter.swift
//  NSHealthTakeHome
//
//  Created by Praks on 08/09/2025.
//

import Foundation
struct AppDateFormatter {
    static let monthDayYear: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "MMMM d, yyyy"
        return format
    }()
    
    static let monthDayYearTime: DateFormatter = {
        let format = DateFormatter()
        format.dateFormat = "MMMM d, yyyy hh:mm:ss"
        return format
    }()
}
