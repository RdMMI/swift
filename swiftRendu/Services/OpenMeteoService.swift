//
//  OpenMeteoService.swift
//  swiftRendu
//
//  Created by DELMAS Olivier on 05/11/2025.
//

import SwiftUI

@Observable
public class OpenMeteoService {
    let baseUrl: String
    let latitude: Double
    let longitude: Double
    let options: String? = "&current=temperature_2m,is_day,precipitation,rain,snowfall,cloud_cover"
    
    public init(
        baseUrl: String = "https://api.open-meteo.com/v1/forecast?",
        latitude: Double,
        longitude: Double
    ) {
        self.baseUrl = baseUrl
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func queryBuilder(latitude: Double, longitude: Double) -> String {
        return "\(baseUrl)latitude=\(latitude)&longitude=\(longitude)\(options ?? "")"
    }
    
    func fetchOpenMeteo(latitude: Double, longitude: Double) async throws -> OpenMeteoModel {
        let queryBuilded = queryBuilder(latitude: latitude, longitude: longitude)
        guard let url = URL(string: queryBuilded) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let result = try JSONDecoder().decode(OpenMeteoModel.self, from: data)
        return result
    }
}
