//
//  LevelModel.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 23.09.2023.
//

import Foundation

struct LevelModel: Codable {
    let levels: [Level]
}

struct Level: Codable {
    let name: String
    let levelPicture: String
    let conversation: String
}
