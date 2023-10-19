//
//  JustifyDetailsViewModel.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 19.10.2023.
//

import Foundation
import SwiftUI
import Combine
import XCoordinator
import Alamofire

class JustifyDetailViewModel: ObservableObject {
    @Published var plants: [FormdataSuggestion] = [] {
        didSet {
            storage.save(plants: plants)
        }
    }
    @Published var plant: FormdataSuggestion
    @Published var selected: Bool
    @Published var isFullDescriptionVisible = false
    @Published var translatedDescription: String?
    @Published var isTranslateButtonTapped: Bool = false

    private var cancellables = Set<AnyCancellable>()
    private let router: UnownedRouter<HomeRoute>
    private let storage = PopularPlantsStorage()
    
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
            self.plants = storage.load()
        }
    }

    func unSelect() {
        if let index = plants.firstIndex(where: { $0.id == plant.id }) {
            self.selected = false
            self.plants.remove(at: index)
            self.storage.save(plants: plants)
            self.plants = storage.load()
        }
    }
    
    func translateDescription() {
        guard let apiKey = Bundle.main.infoDictionary?["GoogleCloudAPIKey"] as? String else {
            print("API Key not found in Info.plist")
            return
        }
        
        let sourceLanguage = "en"
        let targetLanguage = "ru"
        let urlString = "https://translation.googleapis.com/language/translate/v2"
        let parameters: [String: Any] = [
            "key": apiKey,
            "q": plant.details.description.value,
            "source": sourceLanguage,
            "target": targetLanguage
        ]
        
        AF.request(urlString, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any],
                   let translations = json["data"] as? [String: Any],
                   let translatedTexts = translations["translations"] as? [[String: Any]],
                   let translatedText = translatedTexts.first?["translatedText"] as? String {
                    DispatchQueue.main.async {
                        self.translatedDescription = translatedText
                    }
                }
            case .failure(let error):
                print("Request error: \(error)")
            }
        }
    }
    
    func loadPlants() {
        self.plants = storage.load()
    }
}

