//
//  SearchableModifier.swift
//  SwiftRenduDesignSystem
//

import SwiftUI

public struct SearchableModifier<T: Sendable>: ViewModifier {
    @Binding var searchText: String
    @Binding var results: [T]
    @Binding var isLoading: Bool
    @Binding var errorMessage: String?
    
    let placeholder: String
    let searchAction: (String) async throws -> [T]
    
    public init(
        searchText: Binding<String>,
        results: Binding<[T]>,
        isLoading: Binding<Bool>,
        errorMessage: Binding<String?>,
        placeholder: String,
        searchAction: @escaping @Sendable (String) async throws -> [T]
    ) {
        self._searchText = searchText
        self._results = results
        self._isLoading = isLoading
        self._errorMessage = errorMessage
        self.placeholder = placeholder
        self.searchAction = searchAction
    }
    
    public func body(content: Content) -> some View {
        content
            .searchable(text: $searchText, prompt: placeholder)
            .onSubmit(of: .search) {
                performSearch()
            }
    }
    
    private func performSearch() {
        guard !searchText.isEmpty else { return }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                results = try await searchAction(searchText)
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
        }
    }
}

public extension View {
    func customSearchable<T: Sendable>(
        text: Binding<String>,
        results: Binding<[T]>,
        isLoading: Binding<Bool>,
        errorMessage: Binding<String?>,
        placeholder: String = "Search",
        searchAction: @escaping @Sendable (String) async throws -> [T]
    ) -> some View {
        self.modifier(SearchableModifier(
            searchText: text,
            results: results,
            isLoading: isLoading,
            errorMessage: errorMessage,
            placeholder: placeholder,
            searchAction: searchAction
        ))
    }
}
