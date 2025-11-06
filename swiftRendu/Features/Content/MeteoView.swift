//
//  MeteoView.swift
//  swiftRendu
//
//  Created by DAGUET Romain on 06/11/2025.
//

import SwiftUI
import SwiftRenduDesignSystem

struct MeteoView: View {
    @Binding var latitude: Double
    @Binding var longitude: Double
    @Binding var city: String
    @State private var getMeteoTask: Task<Void, Never>?
    @State private var results: OpenMeteoModel?
    @State private var errorMessage: String?
    @State private var isLoading = false
    private var openMeteoService: OpenMeteoService {
        OpenMeteoService(latitude: latitude, longitude: longitude)
    }
    
    private func getMeteo() async {
        isLoading = true
        do {
            results = try await openMeteoService.fetchOpenMeteo(latitude: latitude, longitude: longitude)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    var body: some View {
        ZStack {
            Image("soiree")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            if let results = results {
                VStack {
                    Spacer()
                    DegretComponent(temperature: "\(results.current.temperature_2m)\(results.current_units.temperature_2m)")
                    CityNameComponent(city: city)
                        .padding(.bottom, 300)
                    Spacer()
                    HStack {
                        TodayComponent(today: results.current.time.toDay() ?? "")
                        ImageMeteoComponent(meteo:"Monday")
                    }
                }
                .padding()
            } else if isLoading {
                LoadingComponent()
            } else if let error = errorMessage {
                Text("Erreur: \(error)")
            }
        }
        .task {
            await getMeteo()
        }
    }
}

#Preview {
    MeteoView(
        latitude: .constant(38.1614),
        longitude: .constant(7.9053),
        city: .constant("Cuba")
    )
}
