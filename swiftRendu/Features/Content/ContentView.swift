//
//  ContentView.swift
//  swiftRendu
//
//  Created by DAGUET Romain on 05/11/2025.
//

import SwiftUI
import SwiftRenduDesignSystem

struct ContentView: View {

    @State private var searchText = ""
    @State private var results: [FeatureModel] = []
    @State private var errorMessage: String?
    @State private var isLoading = false
    @State private var searchTask: Task<Void, Never>?
    let geocodeurService = GeocodeurService()
    
    private func performSearch() {
        
        searchTask?.cancel()
        
        guard !searchText.isEmpty && searchText.count>=3 else {
            results = []
            errorMessage = nil
            isLoading = false
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        searchTask = Task {
            do {
                try await Task.sleep(for: .milliseconds(300))
                let data = try await geocodeurService.fetchGeocodeur(query: searchText)
                results = data.features
                isLoading = false
            } catch {
                guard error is CancellationError else {
                    errorMessage = error.localizedDescription
                    isLoading = false
                    return
                }
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if isLoading {
                    LoadingComponent()
                } else if results.isEmpty || errorMessage != nil {
                    ErrorComponent(
                        errorMessage: "Nothing found",
                        errorDescription: "Try a different search",
                        errorIcon: "magnifyingglass"
                    )
                } else {
                    List(results) { feature in
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
            .searchable(text: $searchText, prompt: "Search for a location")
            .onChange(of: searchText) {oldValue, newValue in
                performSearch()
            }
        }
    }
}

#Preview {
    ContentView()
}
