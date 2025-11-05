//
//  RequestCityMock.swift
//  swiftRendu
//
//  Created by DELMAS Olivier on 05/11/2025.
//

import SwiftUI

struct PropertiesModel: Codable {
    let city: String
    let country: String
    let name: String
}

struct GeometryModel: Codable {
    let coordinates: Array<Float>
    let type: String
}

struct FeatureModel: Codable {
    let geometry: GeometryModel
    let properties: PropertiesModel
}

struct GeocodeurModel: Codable {
    let features: [FeatureModel]
}
