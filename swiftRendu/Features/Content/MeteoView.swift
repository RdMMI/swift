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
//                    .padding(.bottom, 10)
                ImageMeteoComponent(meteo:"pluit")
                    .padding(.bottom, 150)
                Spacer()
                HStack(spacing: 0) {
                    TodayComponent(today:"Monfdddddddday")
                        .frame(maxWidth: .infinity)
                        .layoutPriority(1)
                    
                    ImageDayNightComponent(meteo:"soleil")
                        .frame(maxWidth: .infinity)
                        .layoutPriority(0.25)
                }
            }
            .padding()
        }
    }
}

#Preview {
    MeteoView()
}
