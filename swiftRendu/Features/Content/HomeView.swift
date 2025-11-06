//
//  HomeView.swift
//  swiftRendu
//
//  Created by DAGUET Romain on 06/11/2025.
//

import SwiftUI
import SwiftRenduDesignSystem

struct HomeView: View {
    var body: some View {
        ZStack {
            Image("foret")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 400, height: 400)
                    .padding(.bottom, -100)
                AppNameComponent (appname: "BREF METEO")
                    .padding(.bottom, 230)
                Spacer()
            }
            ZStack {
                Image("foret2")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
            }
            HStack {
                TextComponent(text: "Press anywhere")
                    .padding(.top, 760)
            }
        }
    }
}

#Preview {
    HomeView()
}
