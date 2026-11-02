//
//  FeedPost.swift
//  Insta_Feed_UI_App
//
//  Created by Krunal Maisuriya on 02/11/2026.
//

import Foundation

struct FeedPost: Codable, Identifiable {
    let id: UUID
    let description: String
    let userName: String?
    let imageURL: String?
    let createdAt: String?
    let likesCount: Int
}
