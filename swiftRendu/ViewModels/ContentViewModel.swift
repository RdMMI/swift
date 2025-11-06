//
//  ContentViewModel.swift
//  swiftRendu
//
//  Created by DELMAS Olivier on 06/11/2025.
//

import SwiftUI

@Observable
public class ContentViewModel {
    var searchText = ""
    var results: [FeatureModel] = []
    var errorMessage: String?
    var isLoading = false
    var searchTask: Task<Void, Never>?
    let geocodeurService = GeocodeurService()
    
    public func performSearch() {
        
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
}
