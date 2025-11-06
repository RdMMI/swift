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
//                NavbarComponent()
//                CardComponent()
                Spacer()
                DegretComponent(temperature: "32°C")
                NomVilleComponent(city: "Paris")
                    .padding(.bottom, 300)
                Spacer()
                HStack {
                    TodayComponent(today:"Monday")
                    ImageMeteo(meteo:"Monday")
                }
                
                
            }
            .padding()
        }
    }
}

#Preview {
    MeteoView()
}
