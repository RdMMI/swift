import SwiftUI

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
                    ContentUnavailableView(
                        "Service indisponnible",
                        systemImage: "xmark.icloud.fill",
                        description: Text("Reessayer plus tard")
                    )
                } else if results.isEmpty {
                    ContentUnavailableView(
                        "Aucun résultat",
                        systemImage: "magnifyingglass",
                        description: Text("Essayez une autre recherche")
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
            .navigationTitle("Recherche de lieux")
            .searchable(text: $searchText, prompt: "Chercher un lieu")
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
