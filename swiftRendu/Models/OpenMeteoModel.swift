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

extension OpenMeteoModel {
    func getWeatherIcon() -> String {
        let current = self.current
        
        if current.snowfall > 0 {
            return "snow"
        }
        
        if current.rain > 0 || current.precipitation > 0 {
            return "rain"
        }
        
        if current.cloud_cover > 70 {
            return "cloud"
        } else if current.cloud_cover > 30 {
            return "clearSky"
        }
        
        return "cloud"
    }
}

extension OpenMeteoModel {
    func getWeatherBackground() -> String {
        let current = self.current
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
        guard let date = formatter.date(from: current.time) else {
            return "day"
        }
        let hour = Calendar.current.component(.hour, from: date)
        
        guard current.is_day == 1 else {
            return "night"
        }
        
        if hour >= 6 && hour < 12 && current.is_day == 1 {
            return "sunrise"
        }
        
        if hour >= 12 && hour < 18 && current.is_day == 1 {
            return "day"
        }
        
        if hour >= 18 && hour < 22 && current.is_day == 1 {
            return "evening"
        }
        
        return "day"
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
