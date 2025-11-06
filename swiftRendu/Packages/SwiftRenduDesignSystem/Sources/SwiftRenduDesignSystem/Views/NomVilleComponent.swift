//
//  NomVilleComponent.swift
//  SwiftRenduDesignSystem
//
//  Created by DAGUET Romain on 05/11/2025.
//

import SwiftUI
  
    public struct NomVilleComponent: View {
        let city: String
        
        public init(city: String) {
                self.city = city
            }
        
        public var body: some View {
            Text(city)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(Color.DS.blanc)
                
        }
    }

#Preview {
    NomVilleComponent(city: "Parrrris")
    }
