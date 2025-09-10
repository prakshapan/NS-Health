//
//  AppFont.swift
//  NSHealthTakeHome
//
//  Created by Praks on 06/09/2025.
//

import SwiftUI

struct AppFont {
    static let bold = "Montserrat-Bold"
    static let regular = "Montserrat-Regular"
    static let medium = "Montserrat-Medium"
    
    static let regularTitle = Font.custom(regular, size: 32, relativeTo: .title)
    static let regularBody = Font.custom(regular, size: 14, relativeTo: .title)
    static let regularFootnote = Font.custom(regular, size: 10, relativeTo: .footnote)
    
    
    static let mediumTitle = Font.custom(medium, size: 32, relativeTo: .title)
    static let mediumBody = Font.custom(bold, size: 14, relativeTo: .title)
    static let mediumFootnote = Font.custom(medium, size: 10, relativeTo: .footnote)
    
    static let boldTitle = Font.custom(bold, size: 32, relativeTo: .title)
    static let boldTitle3 = Font.custom(bold, size: 17, relativeTo: .title3)
    static let boldHeadline = Font.custom(bold, size: 14, relativeTo: .headline)
    static let boldBody = Font.custom(bold, size: 14, relativeTo: .title)
}
