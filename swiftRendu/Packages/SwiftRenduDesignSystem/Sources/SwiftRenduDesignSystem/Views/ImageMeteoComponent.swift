//
//  ImageMeteoComponent.swift
//  SwiftRenduDesignSystem
//
//  Created by DAGUET Romain on 06/11/2025.
//

import SwiftUI
  
public struct ImageMeteoComponent: View {
    let meteo: String
    
    public init(meteo: String) {
        self.meteo = meteo
    }
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(meteo)
                    .resizable()
                    .frame(width: 200, height: 200)
                Spacer()
            }
        }
    }
}

#Preview {
    ImageMeteoComponent(meteo: "moon")
        .background(Color.gray.opacity(0.9))
}
