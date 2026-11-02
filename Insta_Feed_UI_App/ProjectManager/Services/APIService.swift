//
//  APIService.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 02/11/2026.
//

import Foundation

final class APIService {
    static let shared = APIService()
    
    private let baseURL = "http://127.0.0.1:8080"
    
    private init() { }
    
    // MARK: - Fetch Posts
    func fetchPosts() async throws -> [FeedPost] {
        guard let url = URL(string: "\(baseURL)/api/posts") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let posts = try JSONDecoder().decode([FeedPost].self, from: data)
        
        return posts
    }
}
