//
//  FeedViewModel.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 02/11/2026.
//

import Foundation
import Observation

@Observable
@MainActor
final class FeedViewModel {
    
    var posts: [FeedPost] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let service = APIService.shared
    
    
    // MARK: - Fetch Posts
    func fetchPosts() async {
        isLoading = true
        errorMessage = nil
        
        defer { isLoading = false }
                
        do {
            posts = try await service.fetchPosts()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    // MARK: - Create Post
    func createPost(description: String, userName: String, imageData: Data?) async {
        
        let trimmedDescription = description.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedDescription.isEmpty else {
            errorMessage = "Description cannot be empty."
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        defer { isLoading = false }
                
        do {
            let newPost = try await service.createPost(description: description, userName: userName, imageData: imageData)
            posts.insert(newPost, at: 0)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
