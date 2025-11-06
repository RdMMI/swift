//
//  LoadingComponent.swift
//  SwiftRenduDesignSystem
//
//  Created by DELMAS Olivier on 06/11/2025.
//

import SwiftUI

public struct LoadingComponent: View {
    @State private var rotate = false
    
    public init() {
        
    }
    
    public var body: some View {
        Circle()
            .trim(from: 0.2, to: 1)
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round))
            .frame(width: 40, height: 40)
            .rotationEffect(.degrees(rotate ? 360 : 0))
            .onAppear {
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                    rotate = true
                }
            }
    }
}

#Preview {
    LoadingComponent()
}
