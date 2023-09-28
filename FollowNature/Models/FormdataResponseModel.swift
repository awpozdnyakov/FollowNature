//
//  FormdataResponseModel.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 28.09.2023.
//

import Foundation

struct FormdataResponseModel: Codable {
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

struct DescriptionValue: Codable {
    let value: String
}

struct FormdataImage: Codable {
    let value: URL?
}
