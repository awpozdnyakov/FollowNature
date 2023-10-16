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
import Alamofire

class PlantDetailViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var plant: FormdataSuggestion
    @Published var selected = false
    @Published var isFullDescriptionVisible = false
    @Published var translatedDescription: String?

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
