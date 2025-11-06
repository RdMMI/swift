//
//  ContentViewModel.swift
//  swiftRendu
//
//  Created by DELMAS Olivier on 06/11/2025.
//

import SwiftUI

@Observable
class MeteoViewModel {
    var latitude: Double
    var longitude: Double
    var city: String
    var results: OpenMeteoModel?
    var errorMessage: String?
    var isLoading = false
    
    private var openMeteoService: OpenMeteoService {
        OpenMeteoService(latitude: latitude, longitude: longitude)
    }
    
    init(latitude: Double, longitude: Double, city: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.city = city
    }
    
    func getMeteo() async {
        isLoading = true
        do {
            results = try await openMeteoService.fetchOpenMeteo(latitude: latitude, longitude: longitude)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
