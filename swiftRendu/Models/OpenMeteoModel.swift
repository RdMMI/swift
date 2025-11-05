//
//  RequestCityMock.swift
//  swiftRendu
//
//  Created by DELMAS Olivier on 05/11/2025.
//

import SwiftUI

struct HourlyModel: Codable {
    let time: Array<Date>
    let temperature_2m: Array<Float>
}

struct HourlyUnitModel: Codable {
    let time: Date
    let temperature_2m: String
}

struct CurrentModel: Codable {
    let time: Date
    let temperature_2m: Float
}

struct CurrentUnitModel: Codable {
    let time: String
    let temperature_2m: String
}

struct OpenMeteoModel: Codable {
    let latitude: Float
    let longitude: Float
    let current_units: CurrentUnitModel
    let current: CurrentModel
    let hourly_units: HourlyUnitModel
    let hourly: HourlyModel
}
