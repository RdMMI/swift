//
//  TodayComponent.swift
//  SwiftRenduDesignSystem
//
//  Created by DAGUET Romain on 05/11/2025.
//

import SwiftUI
  
public struct TodayComponent: View {
    let today: String
    
    public init(today: String) {
        self.today = today
    }
    
    public var body: some View {
        VStack {
//            Spacer()
            HStack {
                Text(today)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(Color.DS.blanc)
                Spacer()
            }
        }
        .padding(.bottom, 25)
        .padding(.horizontal, 20)
    }
}

#Preview {
    TodayComponent(today: "Monday")
}
