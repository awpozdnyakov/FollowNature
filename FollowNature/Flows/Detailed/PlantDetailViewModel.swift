//
//  PlantDetailViewModel.swift
//  FollowNature
//
//  Created by ti1ek on 01.10.2023.
//

import SwiftUI

class PlantDetailViewModel: ObservableObject {
    @Published var plant: FormdataSuggestion
    @Published var isFullDescriptionVisible = false
    
    init(plant: FormdataSuggestion) {
        self.plant = plant
    }
    
    func toggleDescriptionVisibility() {
        isFullDescriptionVisible.toggle()
    }
}
