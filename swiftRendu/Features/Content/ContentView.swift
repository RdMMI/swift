import SwiftUI
import SwiftRenduDesignSystem

struct ContentView: View {
    @State private var searchText = ""
    @State private var results: [FeatureModel] = []
    @State private var errorMessage: String?
    @State private var isLoading = false
    
    let geocodeurService = GeocodeurService()
    
    var body: some View {
        NavigationStack {
            VStack {
                if isLoading {
                    ProgressView("Loading...")
                } else if errorMessage != nil {
                    ErrorComponent(
                        errorMessage: "Service unavailable",
                        errorDescription: "The service is currently unavailable",
                        errorIcon: "xmark.icloud.fill"
                    )
                } else if results.isEmpty {
                    ErrorComponent(
                        errorMessage: "Nothing found",
                        errorDescription: "Try a different search",
                        errorIcon: "magnifyingglass"
                    )
                } else {
                    List(results, id: \.properties.name) { feature in
                        VStack(alignment: .leading) {
                            Text(feature.properties.name)
                                .font(.headline)
                            
                            Text("\(feature.properties.state), \(feature.properties.country)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Search for places")
            .customSearchable(
                text: $searchText,
                results: $results,
                isLoading: $isLoading,
                errorMessage: $errorMessage,
                placeholder: "Search for a location"
            ) { query in
                // La logique de recherche est ici, appelée automatiquement
                let data = try await geocodeurService.fetchGeocodeur(query: query)
                return data.features
            }
        }
    }
}

#Preview {
    ContentView()
}
