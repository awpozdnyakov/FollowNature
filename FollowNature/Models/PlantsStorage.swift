//
//  PlantsStorage.swift
//  FollowNature
//
//  Created by Shamil Aglarov on 28.09.2023.
//

import Foundation

class PlantsStorage {
    
    private let key = "savedPlants"
    
    func save(plants: [FormdataSuggestion]) {
        do {
            let data = try JSONEncoder().encode(plants)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Failed to encode and save plants: \(error)")
        }
    }
    
    func load() -> [FormdataSuggestion] {
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            return try JSONDecoder().decode([FormdataSuggestion].self, from: data)
        } catch {
            print("Failed to decode and load plants: \(error)")
            return []
        }
    }
}
