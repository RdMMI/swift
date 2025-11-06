//
//  AppName.swift
//  SwiftRenduDesignSystem
//
//  Created by DAGUET Romain on 06/11/2025.
//

import SwiftUI
  
    public struct TextComponent: View {
        let text: String
        
        public init(text: String) {
                self.text = text
            }
        
        public var body: some View {
            Text(text)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(Color.DS.white)
        }
    }

#Preview {
    TextComponent(text: "Parrrris")
    }
