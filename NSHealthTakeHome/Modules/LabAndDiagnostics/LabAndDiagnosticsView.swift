//
//  LabAndDiagnosticsView.swift
//  NSHealthTakeHome
//
//  Created by Praks on 08/09/2025.
//

import SwiftUI

struct LabAndDiagnosticsView: View {
    @StateObject private var viewModel: LabAndDiagnosticsViewModel
    @EnvironmentObject var nav: NavigationModel
    
    init(viewModel: @autoclosure @escaping () -> LabAndDiagnosticsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }
    
    var body: some View {
        VStack() {
            switch viewModel.state {
            case .idle, .loading:
                placeHolderView
            case .success(data: let report):
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: AppDimensions.standardSpacing) {
                        ForEach(report, id: \.self) { record in
                            ReportItemView(title: record.recordTitle,
                                           description: AppConstants.LabAndDiagnostics.diagnosticReport,
                                           date: record.effectiveDate)
                            .onTapGesture { nav.goToRecordsDetail(with: record) }
                        }
                    }
                    AppViews.endOfResults
                }
            case .failure(message: let error):
                ErrorView(error: error)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical)
        .task { await viewModel.loadDiagnosticReport() }
        .appNavigation(AppConstants.LabAndDiagnostics.title)
    }
    
    struct ReportItemView: View {
        var title: String
        var description: String
        var date: Date?
        
        var body: some View {
            VStack(alignment: .leading, spacing: AppDimensions.standardSpacing) {
                Text(title).font(AppFont.boldHeadline)
                Text(description)
                    .font(AppFont.regularFootnote)
                    .foregroundColor(.gray)
                if let date {
                    Text(date, formatter: AppDateFormatter.monthDayYear)
                        .font(AppFont.mediumFootnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background {
                AppViews.rectangleWithShadow
            }
            .padding()
        }
    }
    
    var placeHolderView: some View {
        VStack() {
            ReportItemView(title: "PlaceHolder Title",
                           description: "Place Holder Description",
                           date: Date())
            .redacted(reason: .placeholder)
            Spacer()
        }
    }
}



