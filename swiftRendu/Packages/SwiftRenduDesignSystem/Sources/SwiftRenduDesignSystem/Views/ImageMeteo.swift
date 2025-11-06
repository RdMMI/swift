//
//  ImageMeteo.swift
//  SwiftRenduDesignSystem
//
//  Created by DAGUET Romain on 06/11/2025.
//

import SwiftUI
  
public struct ImageMeteo: View {
    let meteo: String
    
    public init(meteo: String) {
        self.meteo = meteo
    }
    
    public var body: some View {
        VStack {
//            Spacer()
            HStack {
                Spacer()
                Image("soleil")
                    .resizable()
                    .frame(width: 75, height: 75)
                    
            }
        }
        .padding(.bottom, 25)
        .padding(.horizontal, 20)
    }
}

#Preview {
    ImageMeteo(meteo: "Monday")
}
