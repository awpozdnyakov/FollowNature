//
//  AllDetailsIdentificationModel.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 24.09.2023.
//

import Foundation

struct AllDetailsIdentificationModel: Codable {
    let access_token: String
    let input: ImageAnswer
    let result: ResultAnswer
}

struct ImageAnswer: Codable {
    let images: [URL?]
}

struct ResultAnswer: Codable {
    let result: IsPlant
}

struct IsPlant: Codable {
    let is_plant: Probability
    let classification: Classification
}

struct Classification: Codable {
    let suggestions: [Suggestion]
}
struct Suggestion: Codable, Identifiable {
    let id: String
    let name: String
    let probability: Double
    let similar_images: [SimilarImage]
    let details: [ClassificationDetails]
}

struct ClassificationDetails: Codable {
    let taxonomy: Taxonomy
    let url: URL?
    let description: [DescriptionValue]
}

struct DescriptionValue: Codable {
    let value: String
}

struct Taxonomy: Codable {
    let taxonomyClass: String
    let genus: String
    let order: String
    let family: String
    let phylum: String
    let kingdom: String
}

struct CommonNames: Codable {
    
}

struct SimilarImage: Codable, Identifiable {
    let id: String
    let url: URL?
    let similarity: Double
}

struct Probability: Codable {
    let probability: Double
}

struct Plants: Codable {
    let plants: [Plant]
}

struct Plant: Codable {
    let images: [URL?]
    let name: String
    let family: String
    let description: String
}
