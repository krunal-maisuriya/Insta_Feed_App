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
        errorMessage = ""
        
        defer { isLoading = false }
        
        do {
            posts = try await service.fetchPosts()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
