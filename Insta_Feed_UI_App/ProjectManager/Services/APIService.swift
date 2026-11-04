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
    
    
    // MARK: - Create Posts
    func createPost(description: String, userName: String?, imageData: Data?) async throws -> FeedPost {
        guard let url = URL(string: "\(baseURL)/api/posts") else {
            throw URLError(.badURL)
        }
                
        let boundary = UUID().uuidString
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        var body = Data()
        
        func append(_ string: String) {
            body.append(Data(string.utf8))
        }
        
        append("--\(boundary)\r\n")
        append("Content-Disposition: form-data; name=\"description\"\r\n")
        append("Content-Type: text/plain; charset=utf-8\r\n\r\n")
        append("\(description)\r\n")

        append("--\(boundary)\r\n")
        append("Content-Disposition: form-data; name=\"userName\"\r\n")
        append("Content-Type: text/plain; charset=utf-8\r\n\r\n")
        append("\(userName ?? "")\r\n")
        
        if let imageData, !imageData.isEmpty {
            append("--\(boundary)\r\n")
            append("Content-Disposition: form-data; name=\"image\"; filename=\"post.jpg\"\r\n")
            append("Content-Type: image/jpeg\r\n\r\n")
            body.append(imageData)
            append("\r\n")
        }
        
        // End boundary
        append("--\(boundary)--\r\n")
        
        request.httpBody = body
        
        print("Multipart boundary:", boundary)
        print("Request body size:", body.count)
        print("Image attached:", imageData != nil)

        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let post = try JSONDecoder().decode(FeedPost.self, from: data)
        
        return post
    }
}
