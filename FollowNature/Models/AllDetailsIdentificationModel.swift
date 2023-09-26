//
//  AllDetailsIdentificationModel.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 24.09.2023.
//

import Foundation

struct Base64IdentificationModel: Codable {
    let result: Base64Classification
}

struct Base64Classification: Codable {
    let classification: Base64Suggestions
}

struct Base64Suggestions: Codable {
    let suggestions: [Base64Suggestion]
}
struct Base64Suggestion: Codable, Identifiable {
    let id: String
    let name: String
    let probability: Double
    let similar_images: [SimilarImage]
    let details: Detais
}

struct SimilarImage: Codable {
    let url: URL?
    let similarity: Double
}

struct Detais: Codable {
    let common_names: [String]
    let taxonomy: Taxonomy
    let url: URL? //Wikipedia
    let description: [DescriptionValue]
    let synonyms: [String]
}

struct DescriptionValue: Codable {
    let value: String
}

struct Taxonomy: Codable {
//    let taxonomyClass: String
    let genus: String
    let order: String
    let family: String
    let phylum: String
    let kingdom: String
}




//struct Probability: Codable {
//    let probability: Double
//}
//
//struct Plants: Codable {
//    let plants: [Plant]
//}
//
//struct Plant: Codable {
//    let images: [URL?]
//    let name: String
//    let family: String
//    let description: String
//}
