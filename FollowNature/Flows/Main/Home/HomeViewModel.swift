//
//  HomeViewModel.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import Foundation
import SwiftUI
import Combine
import XCoordinator
import Moya

final class HomeViewModel: ObservableObject {
    
    @Published var plants: [FormdataSuggestion] = [] {
        didSet {
            storage.save(plants: plants)
            updateLevel()
        }
    }
    @Published var justifyPlants: [FormdataSuggestion] = []
    @Published var selectedMedia: UIImage?
    @Published var showMediaPicker: Bool = false
    @Published var showImagePicker: Bool = false
    @Published var selected: Bool = false
    @Published var userLevel: UserLevel = .specialist
    
    private let router: UnownedRouter<HomeRoute>
    private let service: RecognitionService
    private let storage = PlantsStorage()
    private var cancellable: AnyCancellable?
    
    init(
        router: UnownedRouter<HomeRoute>,
        service: RecognitionService = RecognitionServiceImpl()
    ) {
        self.router = router
        self.service = service
        self.plants = storage.load()
        self.userLevel = UserPreferences.shared.userLevel
        updateLevel()
    }
    
    func increaseSearchCount() {
         let currentSearches = UserPreferences.shared.numberOfSearches
         UserPreferences.shared.numberOfSearches = currentSearches + 1
         updateLevel()
     }

     func updateLevel() {
         userLevel = UserLevel.determineLevel(from: UserPreferences.shared.numberOfSearches)
         UserPreferences.shared.userLevel = userLevel
     }
    
    // MARK: - Loading
    func pushFormdataPhoto(photo: UIImage) {
        cancellable = service.postFormdataPhoto(photo: photo)
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { result in
                print(result)
                self.justifyPlants = result.result.classification.suggestions
                if let positive = self.justifyPlants.first {
                    self.plants.append(positive)
                }
                self.showJustifyScreen(plants: self.justifyPlants)
            })
    }
    
    func pushBase64Photo(photo: PhotoBase64Model) {
        cancellable = service.postBase64Photo(photo: photo)
            .sink(receiveCompletion: { completion in
                print(completion)
            }, receiveValue: { result in
                print(result)
            })
    }
    
    
    // MARK: - Routing
    func showJustifyScreen(plants: [FormdataSuggestion]) {
        router.trigger(.jistify(plants))
    }
    
    func showDetailScreen(plant: FormdataSuggestion) {
        router.trigger(.details(plant))
    }
}
