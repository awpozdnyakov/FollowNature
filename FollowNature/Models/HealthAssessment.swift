//
//  HealthAssessment.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 24.09.2023.
//

import Foundation

struct HealthAssessmentModel: Codable {
    let result: HealthResult
}

struct HealthResult: Codable {
    let is_healthy: Probability
    let disease: HealthSuggestions
}

struct HealthSuggestions: Codable {
    let suggestions: [HealthSuggestion]
}

struct HealthSuggestion: Codable {
    let id: String
    let name: String
    let probability: Double
    let similar_images: [SimilarImage]
    let detail: HealthDetail
}

struct HealthDetail:Codable {
    let description: String
    let url: URL?
    let treatment: Treatment
}

struct Treatment: Codable {
    let biological: [String]
    let prevention: [String]
}
