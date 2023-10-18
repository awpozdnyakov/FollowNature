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
    @Published var currentPlant: PlantInfo?
    
    @Published var page: PadPage = .selected
    @Published var searchText: String = ""
    
    private let storage = PopularPlantsStorage()
    private let router: UnownedRouter<NotepadRoute>
    
    init(
        router: UnownedRouter<NotepadRoute>
    ) {
        self.router = router
        self.plants = storage.load()
    }
    
    func searchedPlanstBy(name: String) {
        TrefleAPIManager.shared.searchPlantByName(name) { (result: Result<Welcome, Error>) in
            switch result {
            case .success(let searchResponse):
                if let plant = searchResponse.data.first {
                    let plantInfo = PlantInfo(
                        id: plant.id,
                        scientificName: plant.scientificName,
                        family: plant.family,
                        genus: plant.genus,
                        genusID: plant.genusID,
                        synonyms: plant.synonyms,
                        commonName: plant.commonName,
                        imageURL: plant.imageURL
                    )
                    print(plant)
                    self.currentPlant = plantInfo
                } else {
                    print("Растение не найдено.")
                }
            case .failure(let error):
                print("Ошибка:", error)
            }
        }
    }
}

enum PadPage: Int {
    case selected
    case lookingFor
}
