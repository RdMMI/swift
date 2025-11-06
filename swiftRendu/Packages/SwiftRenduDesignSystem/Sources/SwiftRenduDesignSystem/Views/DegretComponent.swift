//
//  DegretComponent.swift
//  SwiftRenduDesignSystem
//
//  Created by DAGUET Romain on 05/11/2025.
//

import SwiftUI
  
    public struct DegretComponent: View {
        let temperature: String
        
        public init(temperature: String) {
                self.temperature = temperature
            }
        
        public var body: some View {
            Text(temperature)
                .font(.system(size: 86, weight: .bold))
                .foregroundColor(Color.DS.white)
        }
    }

#Preview {
    DegretComponent(temperature: "32°C")
}
