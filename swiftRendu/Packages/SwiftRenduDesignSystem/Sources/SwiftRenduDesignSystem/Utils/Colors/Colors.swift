import SwiftUI

extension Color {
    struct DS {
        // Primary Colors (Bleu foncé)
        static let primary = Color(red: 3/255, green: 4/255, blue: 94/255) // #03045E
        static let primaryLight = Color(red: 0/255, green: 119/255, blue: 182/255) // #0077B6
        static let primaryDark = Color(red: 3/255, green: 4/255, blue: 94/255) // #03045E
        
        // Secondary Colors (Bleu moyen)
        static let secondary = Color(red: 0/255, green: 180/255, blue: 216/255) // #00B4D8
        static let secondaryLight = Color(red: 144/255, green: 224/255, blue: 239/255) // #90E0EF
        static let secondaryDark = Color(red: 0/255, green: 119/255, blue: 182/255) // #0077B6
        
        // Background Colors
        static let background = Color(red: 0.04, green: 0.04, blue: 0.04) // Noir profond
        static let backgroundElevated = Color(red: 0.11, green: 0.11, blue: 0.12)
        static let backgroundCard = Color(red: 0.17, green: 0.17, blue: 0.18)
        
        // Surface Colors
        static let surface = Color(red: 0.11, green: 0.11, blue: 0.12)
        static let surfaceSecondary = Color(red: 0.17, green: 0.17, blue: 0.18)
        
        // Text Colors
        static let text = Color(red: 202/255, green: 240/255, blue: 248/255) // #CAF0F8 - Bleu très clair
        static let textSecondary = Color(red: 144/255, green: 224/255, blue: 239/255) // #90E0EF
        static let textTertiary = Color(red: 144/255, green: 224/255, blue: 239/255).opacity(0.6)
        
        // Accent
        static let accent = Color(red: 0/255, green: 180/255, blue: 216/255) // #00B4D8
        
        // Border & Divider
        static let border = Color(red: 0.22, green: 0.22, blue: 0.23)
        static let divider = Color(red: 0/255, green: 119/255, blue: 182/255).opacity(0.3)
        
        // States
        static let hover = Color(red: 0/255, green: 180/255, blue: 216/255).opacity(0.1)
        static let pressed = Color(red: 0/255, green: 180/255, blue: 216/255).opacity(0.2)
        static let disabled = Color(red: 0.23, green: 0.23, blue: 0.24)
    }
}
