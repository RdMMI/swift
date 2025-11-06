//
//  HomeView.swift
//  swiftRendu
//
//  Created by DAGUET Romain on 06/11/2025.
//

import SwiftUI
import SwiftRenduDesignSystem

struct HomeView: View {
    @State private var showContentView = false
    
    var body: some View {
        ZStack {
            if showContentView {
                ContentView()
                    .transition(.move(edge: .bottom))
            } else {
                ZStack {
                    Image("forest")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    VStack {
                        Spacer()
                        Image("logo")
                            .resizable()
                            .frame(width: 400, height: 400)
                            .padding(.bottom, -100)
                        AppNameComponent(appname: "BREF METEO")
                            .padding(.bottom, 200)
                        Spacer()
                    }
                    ZStack {
                        Image("forestFrontPlan")
                            .resizable()
                            .scaledToFill()
                            .ignoresSafeArea()
                    }
                    HStack {
                        TextComponent(text: "Press anywhere")
                            .padding(.top, 780)
                    }
                }
                .transition(.move(edge: .top))
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.6)) {
                        showContentView = true
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
