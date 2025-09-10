//
//  RecordsView.swift
//  NSHealthTakeHome
//
//  Created by Praks on 06/09/2025.
//

import SwiftUI
// MARK: - Profile

enum RecordTypes: CaseIterable, Hashable {
    case labAndDiagnostics
    
    var title: String {
        switch self {
        case .labAndDiagnostics: return AppConstants.Records.labAndDiagnositics
        }
    }
    
    var details: String {
        switch self {
        case .labAndDiagnostics: return AppConstants.Records.labAndDiagnositicsDetails
        }
    }
}

struct RecordsView: View {
    @EnvironmentObject var nav: NavigationModel
    @StateObject private var viewModel: LabAndDiagnosticsViewModel
    
    init(viewModel: @autoclosure @escaping () -> LabAndDiagnosticsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }
    
    var body: some View {
        VStack(spacing: 8) {
            AppNavigationTitleView(title: "Records")
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 8) {
                    ForEach(RecordTypes.allCases, id: \.self) { record in
                        RecordListItemView(title: record.title,
                                           description: record.details)
                        .onTapGesture {
                            nav.goToLabAndDiagnostics()
                        }
                        
                    }
                }
            }
            .frame(maxHeight: .infinity)
        }
        .ignoresSafeArea(edges: .top)
        .task { await viewModel.loadDiagnosticReport() }
    }
    
    struct RecordListItemView: View {
        var title: String
        var description: String
        
        var body: some View {
            HStack() {
                Image(.labreport)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 25)
                    .foregroundColor(.primary)
                VStack(alignment: .leading, spacing: AppDimensions.standardSpacing) {
                    Text(title).font(AppFont.boldHeadline)
                    Text(description)
                        .font(AppFont.regularBody)
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background { AppViews.rectangleWithShadow }
            .padding()
        }
    }
}






