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
    
    @Published var plant: FormdataSuggestion
    @Published var selected = false
    @Published var isFullDescriptionVisible = false
    
    private let router: UnownedRouter<HomeRoute>
    
    init(
        plant: FormdataSuggestion,
        router: UnownedRouter<HomeRoute>
    ) {
        self.plant = plant
        self.router = router
    }
    
    func toggleDescriptionVisibility() {
        isFullDescriptionVisible.toggle()
    }
}
