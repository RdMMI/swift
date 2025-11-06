//
//  AppName.swift
//  SwiftRenduDesignSystem
//
//  Created by DAGUET Romain on 06/11/2025.
//

import SwiftUI
  
    public struct AppNameComponent: View {
        let appname: String
        
        public init(appname: String) {
                self.appname = appname
            }
        
        public var body: some View {
            Text(appname)
                .font(.system(size: 52, weight: .bold))
                .foregroundColor(Color.DS.white)
        }
    }

#Preview {
    AppNameComponent(appname: "Parrrris")
    }
