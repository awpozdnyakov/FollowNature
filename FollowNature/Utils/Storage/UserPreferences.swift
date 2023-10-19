//
//  UserPreferences.swift
//  FollowNature
//
//  Created by ti1ek on 15.10.2023.
//

import Foundation

class UserPreferences {

    static let shared = UserPreferences()

    private init() {}

    private let numberOfSearchesKey = "numberOfSearchesKey"
    private let userLevelKey = "userLevelKey"

    var numberOfSearches: Int {
        get {
            UserDefaults.standard.integer(forKey: numberOfSearchesKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: numberOfSearchesKey)
        }
    }

    var userLevel: UserLevel {
        get {
            if let storedLevel = UserDefaults.standard.string(forKey: userLevelKey),
               let level = UserLevel(rawValue: storedLevel) {
                return level
            }
            return .dilettante
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: userLevelKey)
        }
    }
}

