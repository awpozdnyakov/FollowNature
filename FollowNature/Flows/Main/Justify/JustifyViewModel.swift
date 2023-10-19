//
//  JustifyViewModel.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 03.10.2023.
//

import Foundation
import SwiftUI
import Combine
import XCoordinator
import Moya

class JustifyViewModel: ObservableObject {
    @Published var justifyPlants: [FormdataSuggestion]
    @Published var selected = false
    @Published var isFullDescriptionVisible = false
    @Published var plants: [FormdataSuggestion] = [] {
        didSet {
            storage.save(plants: plants)
        }
    }
    
    private let router: UnownedRouter<HomeRoute>
    private let storage = PopularPlantsStorage()
    
    init(
        justifyPlants: [FormdataSuggestion],
        router: UnownedRouter<HomeRoute>
    ) {
        self.justifyPlants = justifyPlants
        self.router = router
        self.plants = storage.load()
    }
    
//    func showDetailScreen(plant: FormdataSuggestion, selected: Bool) {
//        router.trigger(.details(plant, selected))
//    }
}

