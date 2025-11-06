//
//  NomVilleComponent.swift
//  SwiftRenduDesignSystem
//
//  Created by DAGUET Romain on 05/11/2025.
//

import SwiftUI
  
    public struct CityNameComponent: View {
        let city: String
        
        public init(city: String) {
                self.city = city
            }
        
        public var body: some View {
            Text(city)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(Color.DS.white)
        }
    }

#Preview {
    CityNameComponent(city: "Parrrris")
    }
