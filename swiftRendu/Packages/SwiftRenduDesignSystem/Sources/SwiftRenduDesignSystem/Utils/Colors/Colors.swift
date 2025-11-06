import SwiftUI

extension Color {
    public struct DS {
        // Primary Colors (Bleu foncé)
        public static let primary = Color(red: 219/255, green: 237/255, blue: 251/255) // #dbedfb
        public static let primaryLight = Color(red: 0/255, green: 119/255, blue: 182/255) // #0077B6
        public static let primaryDark = Color(red: 3/255, green: 4/255, blue: 94/255) // #03045E
        
        // Secondary Colors (Bleu moyen)
        public static let secondary = Color(red: 105/255, green: 160/255, blue: 251/255) // #69a0fb
        public static let secondaryLight = Color(red: 144/255, green: 224/255, blue: 239/255) // #90E0EF
        public static let secondaryDark = Color(red: 0/255, green: 119/255, blue: 182/255) // #0077B6
        
        // card Colors
        public static let background = LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 79/255, green: 124/255, blue: 201/255),
                        Color(red: 13/255, green: 66/255, blue: 158/255)
                    ]),
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading
                )
        public static let backgroundElevated = Color(red: 0.11, green: 0.11, blue: 0.12)
        public static let backgroundCard = Color(red: 0.17, green: 0.17, blue: 0.18)
        
        // degret Colors
        public static let blanc = Color(red: 255/255, green: 255/255, blue: 255/255) // #ffffff
        public static let surfaceSecondary = Color(red: 0.17, green: 0.17, blue: 0.18)
        
        
        
        
        
        
        
        
        
        // Text Colors
        public static let text = Color(red: 202/255, green: 240/255, blue: 248/255) // #CAF0F8 - Bleu très clair
        public static let textSecondary = Color(red: 144/255, green: 224/255, blue: 239/255) // #90E0EF
        public  static let textTertiary = Color(red: 144/255, green: 224/255, blue: 239/255).opacity(0.6)
        
        // Accent
        public  static let accent = Color(red: 0/255, green: 180/255, blue: 216/255) // #00B4D8
        
        // Border & Divider
        public static let border = Color(red: 0.22, green: 0.22, blue: 0.23)
        public static let divider = Color(red: 0/255, green: 119/255, blue: 182/255).opacity(0.3)
        
        // States
        public static let hover = Color(red: 0/255, green: 180/255, blue: 216/255).opacity(0.1)
        public static let pressed = Color(red: 0/255, green: 180/255, blue: 216/255).opacity(0.2)
        public static let disabled = Color(red: 0.23, green: 0.23, blue: 0.24)
    }
}
