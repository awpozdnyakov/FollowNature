//
//  PlantDetailViewModel.swift
//  FollowNature
//
//  Created by ti1ek on 01.10.2023.
//

import Foundation
import SwiftUI
import Combine
import XCoordinator

class PlantDetailViewModel: ObservableObject {
    
    @Published var plants: [FormdataSuggestion] = [] {
        didSet {
            storage.save(plants: plants)
        }
    }
    @Published var plant: FormdataSuggestion
    @Published var selected: Bool
    @Published var isFullDescriptionVisible = false
    
    private let router: UnownedRouter<HomeRoute>
    private let storage = PlantsStorage()
    
    init(
        plant: FormdataSuggestion,
        selected: Bool,
        router: UnownedRouter<HomeRoute>
    ) {
        self.plant = plant
        self.selected = selected
        self.router = router
        self.plants = storage.load()
    }
    
    func toggleDescriptionVisibility() {
        isFullDescriptionVisible.toggle()
    }
    
    func select() {
        if !plants.contains(where: { $0.id == plant.id }) {
            self.selected = true
            self.plants.append(plant)
            self.storage.save(plants: plants)
        }
    }

    func unSelect() {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            self.selected = false
            self.plants.remove(at: index)
            self.storage.save(plants: plants)
        }
    }
}
