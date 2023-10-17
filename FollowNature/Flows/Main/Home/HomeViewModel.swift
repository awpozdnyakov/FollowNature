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
    
    @Published var popularPlants: [FormdataSuggestion] = [] {
        didSet {
            storage.save(plants: popularPlants)
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
    private let storage = PopularPlantsStorage()
    private var cancellable: AnyCancellable?
    
    init(
        router: UnownedRouter<HomeRoute>,
        service: RecognitionService = RecognitionServiceImpl()
    ) {
        self.router = router
        self.service = service
        self.popularPlants = storage.load()
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
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Запрос завершился с ошибкой: \(error)")
                    let defaultSuggestion = FormdataSuggestion(
                        id: "",
                        name: "Не определено",
                        probability: 0,
                        details: FormdataDetails(
                            common_names: nil,
                            taxonomy: nil,
                            url: nil,
                            description: DescriptionValue(value: "Попробуйте выполнить поиск повторно"),
                            synonyms: nil,
                            image: FormdataImage(value: nil),
                            rank: nil
                        )
                    )
                    self.justifyPlants = [defaultSuggestion]
                    self.showJustifyScreen(justifyPlants: self.justifyPlants)
                }
            }, receiveValue: { result in
                print(result)
                self.increaseSearchCount()
                if let suggestions = result.result?.classification.suggestions {
                    self.justifyPlants = suggestions
                    if let positive = self.justifyPlants.first {
                        if !self.popularPlants.contains(where: { $0.id == positive.id }) {
                            self.popularPlants.append(positive)
                        }
                        self.showJustifyScreen(justifyPlants: self.justifyPlants)
                    }
                }
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
    func showJustifyScreen(justifyPlants: [FormdataSuggestion]) {
        router.trigger(.jistify(justifyPlants))
    }
    
    func showDetailScreen(plant: FormdataSuggestion, selected: Bool) {
        router.trigger(.details(plant, selected))
    }
}
