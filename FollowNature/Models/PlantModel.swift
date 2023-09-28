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
