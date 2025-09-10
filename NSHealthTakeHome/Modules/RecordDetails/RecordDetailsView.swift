//
//  RecordDetailsView.swift
//  NSHealthTakeHome
//
//  Created by Praks on 07/09/2025.
//

import SwiftUI

struct RecordDetailsView: View {
    @EnvironmentObject var nav: NavigationModel
    
    var reportBundle: DiagnosticReportBundle
    var body: some View {
        ScrollView() {
            LazyVStack(alignment: .leading, spacing: AppDimensions.doubleSpacing) {
                RecordItemView(title: AppConstants.RecordDetails.reportName,
                               description: reportBundle.recordTitle)
                RecordItemView(title: AppConstants.RecordDetails.testPerformer,
                               description: reportBundle.performedBy)
                if let effectiveDate = reportBundle.effectiveDate {
                    RecordItemView(title: AppConstants.RecordDetails.resultDateAndTime,
                                   description: AppDateFormatter.monthDayYearTime.string(from: effectiveDate))
                }
                
                Divider()
                
                ForEach(reportBundle.observations, id: \.self) { observation in
                    ObservationItemView(title: observation.title,
                                        result: observation.observedValue,
                                        normalRange: observation.normalRange)
                }
            }
        }
        .padding(AppDimensions.tripleSpacing)
        .appNavigation(reportBundle.recordTitle)
        
    }
    
    struct RecordItemView: View {
        var title: String
        var description: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: AppDimensions.standardSpacing) {
                Text(title).font(AppFont.boldBody)
                Text(description).font(AppFont.regularBody)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, AppDimensions.standardSpacing)
        }
    }
    
    struct ObservationItemView: View {
        var title: String
        var result: String
        var normalRange: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: AppDimensions.standardSpacing) {
                Text(title).font(AppFont.boldBody)
                HStack() {
                    Text(AppConstants.RecordDetails.result).font(AppFont.boldBody)
                    Text(result).font(AppFont.regularBody)
                    Spacer()
                }
                
                if normalRange != AppConstants.NoValue.noNormalRange {
                    HStack() {
                        Text(AppConstants.RecordDetails.normalRange).font(AppFont.boldBody)
                        Text(normalRange).font(AppFont.regularBody)
                        Spacer()
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, AppDimensions.standardSpacing)
        }
    }
}
