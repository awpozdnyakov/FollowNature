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
    
    @Published var plants: [FormdataSuggestion]
    @Published var selected = false
    @Published var isFullDescriptionVisible = false
    
    private let router: UnownedRouter<HomeRoute>
    
    init(
        plants: [FormdataSuggestion],
        router: UnownedRouter<HomeRoute>
    ) {
        self.plants = plants
        self.router = router
    }
    
    func showDetailScreen(plant: FormdataSuggestion) {
        router.trigger(.details(plant))
    }
}

