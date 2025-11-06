//
//  CardComponent.swift
//  SwiftRenduDesignSystem
//
//  Created by DAGUET Romain on 05/11/2025.
//

import SwiftUI

public struct CardComponent: View {
    public init() { }
    
    public var body: some View {
        VStack {
                DegretComponent(temperature: "32°C")
                Image("soleil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.top, -75)
            NomVilleComponent(city: "Paris")
            }
        .foregroundColor(Color.DS.primary)
        .background(Color.DS.background) 
        .cornerRadius(12)
        .padding()
        
    }
}

#Preview {
        CardComponent()
    }

