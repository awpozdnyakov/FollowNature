//
//  PlantModel.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 25.09.2023.
//

import Foundation

struct PlantModel: Codable, Identifiable {
    let id: String
    let name: String
    let probability: Double
    let image: URL?
    let details: String
}


// TODO: FormdataModel
struct FormdataIdentificationModel: Codable {
    let result: FormdataClassification
}

struct FormdataClassification: Codable {
    let classification: FormdataSuggestions
}

struct FormdataSuggestions: Codable {
    let suggestions: [FormdataSuggestion]
}

struct FormdataSuggestion: Codable, Identifiable {
    let id: String
    let name: String
    let probability: Double
    let details: FormdataDetails
}

struct FormdataDetails: Codable {
    let common_names: [String]?
    let url: URL? //Wikipedia
    let description: DescriptionValue
    let synonyms: [String]?
    let image: FormdataImage
    let rank: String?
}

struct FormdataImage: Codable {
    let value: URL?
}


// TODO: PhotoModel
struct PhotoBase64Model: Codable {
    let images: [String]
    let latitude: Double
    let longitude: Double
    let similar_images: Bool
}
