import SwiftUI
import SwiftRenduDesignSystem

struct ContentView: View {
    @State private var searchText = ""
    let geocodeurService = GeocodeurService()
    @State private var results: [FeatureModel] = []
    @State private var errorMessage: String?
    @State private var isLoading = false
    
    private func performSearch() {
        guard !searchText.isEmpty else { return }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let data = try await geocodeurService.fetchGeocodeur(query: searchText)
                results = data.features
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if isLoading {
                    ProgressView("Chargement...")
                } else if errorMessage != nil {
                    ErrorComponent(
                        errorMessage: "Service unavailable",
                        errorDescription: "the service is currently unavailable",
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
            .searchable(text: $searchText, prompt: "Search for a location")
            .onSubmit(of: .search) {
                performSearch()
            }
            .task {
                performSearch()
            }
        }
    }
}

#Preview {
    ContentView()
}
