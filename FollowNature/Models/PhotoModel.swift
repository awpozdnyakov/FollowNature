//
//  PhotoModel.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 28.09.2023.
//

import Foundation

struct PhotoBase64Model: Codable {
    let images: [String]
    let latitude: Double
    let longitude: Double
    let similar_images: Bool
}
