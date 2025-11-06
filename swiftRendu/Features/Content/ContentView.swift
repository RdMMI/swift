//
//  ContentView.swift
//  swiftRendu
//
//  Created by DAGUET Romain on 05/11/2025.
//

import SwiftUI
import SwiftRenduDesignSystem

struct ContentView: View {
   @State var contentViewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if contentViewModel.isLoading {
                    LoadingComponent()
                } else if contentViewModel.results.isEmpty || contentViewModel.errorMessage != nil {
                    ErrorComponent(
                        errorMessage: "Nothing found",
                        errorDescription: "Try a different search",
                        errorIcon: "magnifyingglass"
                    )
                } else {
                    List(contentViewModel.results) { feature in
                        NavigationLink(destination: MeteoView(
                            latitude: .constant(feature.geometry.coordinates[1]),
                            longitude: .constant(feature.geometry.coordinates[0]),
                            city: .constant(feature.properties.name)
                        )) {
                            VStack(alignment: .leading) {
                                Text(feature.properties.name)
                                    .font(.headline)
                                
                                Text(feature.properties.state != nil ? "\(feature.properties.state!), \(feature.properties.country)" : feature.properties.country)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Search for places")
            .searchable(text: $contentViewModel.searchText, prompt: "Search for a location")
            .onChange(of: contentViewModel.searchText) {oldValue, newValue in
                contentViewModel.performSearch()
            }
        }
    }
}

#Preview {
    ContentView()
}
