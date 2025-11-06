//
//  ContentView.swift
//  swiftRendu
//
//  Created by DAGUET Romain on 05/11/2025.
//
import SwiftUI
import SwiftRenduDesignSystem

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("jours")
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
    ContentView()
}
