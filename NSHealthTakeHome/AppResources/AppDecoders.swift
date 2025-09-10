//
//  AppDecoders.swift
//  NSHealthTakeHome
//
//  Created by Praks on 07/09/2025.
//

import Foundation
struct AppDecoders {
    static var jsonDecoderWithDates: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}
