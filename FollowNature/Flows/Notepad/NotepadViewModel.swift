//
//  NotePadViewModel.swift
//  FollowNature
//
//  Created by Shamil Aglarov on 09.10.2023.
//

import Foundation
import SwiftUI
import Combine
import XCoordinator
import Moya

final class NotepadViewModel: ObservableObject {
    @Published var plants: [FormdataSuggestion] = [] {
        didSet {
            storage.save(plants: plants)
        }
    }

    private let storage = PlantsStorage()
    private let router: UnownedRouter<NotepadRoute>
    
    init(
        router: UnownedRouter<NotepadRoute>
    ) {
        self.router = router
        self.plants = storage.load()
    }
}
