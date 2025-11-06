//
//  GeocodeurService.swift
//  swiftRendu
//
//  Created by DELMAS Olivier on 05/11/2025.
//

import SwiftUI

@Observable
public class GeocodeurService {
    let baseUrl: String
    let limit: Int?
    let lang: String?
    let query: String = "?q="
    
    init(
        baseUrl: String = "https://photon.komoot.io/api/",
        limit: Int? = nil,
        lang: String? = nil
    ) {
        self.baseUrl = baseUrl
        self.limit = limit
        self.lang = lang
    }
    
    func queryBuilder(query: String) -> String {
        var url = baseUrl + self.query + query
        if (limit != nil) {
            url += "&limit=\(limit!)"
        }
        
        if (lang != nil) {
           url += "&lang=\(lang!)"
        }
        
        return url
    }
    
    func fetchGeocodeur(query: String) async throws -> GeocodeurModel {
        let queryBuilded = queryBuilder(query: query)
        guard let url = URL(string: queryBuilded) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let result = try JSONDecoder().decode(GeocodeurModel.self, from: data)
        return result
    }
}
