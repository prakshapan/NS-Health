//
//  AppConstants.swift
//  NSHealthTakeHome
//
//  Created by Praks on 06/09/2025.
//


struct AppConstants {
    static let home = "Home"
    static let records = "Records"
    
    struct Home {
        static let demoApp = "Demo App"
    }
    
    struct LabAndDiagnostics {
        static let title = "Lab and Diagnostics"
        static let diagnosticReport = "Diagonistic Report"
    }
    
    struct Records {
        static let labAndDiagnositics = "Lab and Diagnostics"
        static let labAndDiagnositicsDetails = "Result for blood, urine and general lab."
        static let endOfResults = "End of results."
    }
    
    struct RecordDetails {
        static let reportName = "Report Name"
        static let testPerformer = "Test Performer"
        static let resultDateAndTime = "Result Date and Time"
        
        static let result = "Result: "
        static let normalRange = "Normal Range: "
    }
    
    struct NoValue {
        static let noValue = "No Value."
        static let noNormalRange = "No Normal Range."
        
        static let unknownReport = "Unknown Report"
        static let unknownPerformer = "Unknown Report"
    }

}
