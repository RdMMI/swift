//
//  MeteoView.swift
//  swiftRendu
//
//  Created by DAGUET Romain on 06/11/2025.
//

import SwiftUI
import SwiftRenduDesignSystem

struct MeteoView: View {
    var body: some View {
        ZStack {
            Image("soiree")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Spacer()
                DegretComponent(temperature: "32°C")
                CityNameComponent(city: "Paris")
                    .padding(.bottom, 300)
                Spacer()
                HStack {
                    TodayComponent(today:"Monday")
                    ImageMeteoComponent(meteo:"Monday")
                }
            }
            .padding()
        }
    }
}

#Preview {
    MeteoView()
}
