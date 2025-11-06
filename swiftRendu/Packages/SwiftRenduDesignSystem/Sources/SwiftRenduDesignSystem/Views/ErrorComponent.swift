//
//  ErrorComponent.swift
//  SwiftRenduDesignSystem
//
//  Created by DELMAS Olivier on 05/11/2025.
//

import SwiftUI

public struct ErrorComponent: View {
    let errorMessage: String
    let errorDescription: String
    let errorIcon: String
    
    public init(
        errorMessage: String = "Service unavailable",
        errorDescription: String = "Service is temporarily unavailable",
        errorIcon: String = "xmark.circle.fill"
    ) {
        self.errorMessage = errorMessage
        self.errorDescription = errorDescription
        self.errorIcon = errorIcon
    }
    
    public var body: some View {
        ContentUnavailableView(
            errorMessage,
            systemImage: errorIcon,
            description: Text(errorDescription)
        )
    }
}

#Preview {
    ErrorComponent()
}
