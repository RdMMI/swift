//
//  RequestCityMock.swift
//  swiftRendu
//
//  Created by DELMAS Olivier on 05/11/2025.
//

import SwiftUI

struct CurrentModel: Codable {
    let time: String
    let temperature_2m: Float
    let is_day: Int
    let precipitation: Float
    let rain: Float
    let snowfall: Float
    let cloud_cover: Int
}

extension String {
    func toDay() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        formatter.locale = Locale(identifier: "en_US")
        guard let date = formatter.date(from: self) else { return nil }
        
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE"
        dayFormatter.locale = Locale(identifier: "en_US")
        return dayFormatter.string(from: date)
    }
}

struct CurrentUnitModel: Codable {
    let time: String
    let temperature_2m: String
    let precipitation: String
    let rain: String
    let snowfall: String
    let cloud_cover: String
}

struct OpenMeteoModel: Codable {
    let latitude: Double
    let longitude: Double
    let current_units: CurrentUnitModel
    let current: CurrentModel
}
