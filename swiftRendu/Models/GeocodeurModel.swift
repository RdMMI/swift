//
//  RequestCityMock.swift
//  swiftRendu
//
//  Created by DELMAS Olivier on 05/11/2025.
//

import SwiftUI

struct PropertiesModel: Codable {
    let country: String
    let name: String
    let state: String?
    let city: String?
}

struct GeometryModel: Codable {
    let coordinates: Array<Double>
    let type: String
}

struct FeatureModel: Codable, Identifiable {
    let id: UUID = UUID()
    let geometry: GeometryModel
    let properties: PropertiesModel
    
    enum CodingKeys: String, CodingKey {
        case geometry
        case properties
    }
}

struct GeocodeurModel: Codable {
    let features: [FeatureModel]
}
