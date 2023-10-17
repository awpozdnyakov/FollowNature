//
//  NotepadViewModel.swift
//  FollowNature
//
//  Created by Shamil Aglarov on 17.10.2023.
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
    @Published var page: PadPage = .selected
    
    private let storage = PopularPlantsStorage()
    private let router: UnownedRouter<NotepadRoute>
    
    init(
        router: UnownedRouter<NotepadRoute>
    ) {
        self.router = router
        self.plants = storage.load()
    }
}

enum PadPage: Int {
    case selected
    case lookingFor
}
