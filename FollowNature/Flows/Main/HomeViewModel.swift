//
//  HomeViewModel.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import Combine
import XCoordinator
import Moya
import Foundation


final class HomeViewModel: ObservableObject {
    
    @Published var plants: [PlantModel] = [PlantModel(id: "sdf", name: "sd24mdcf", probability: 9, image: nil, details: "fddf"),
                                           PlantModel(id: "234f", name: "wef3d", probability: 9, image: nil, details: "lalalalalalalala"),
                                           PlantModel(id: "sefdf", name: "wef4d3", probability: 9, image: nil, details: "gggggggggggggggg")]
    @Published var avatar: URL?

    private let router: UnownedRouter<HomeRoute>
//    private let service: RecognitionService
 
    private var cancellable: AnyCancellable?
    
    
    init(
        router: UnownedRouter<HomeRoute>
//        service: RecognitionService = RecognitionServiceImpl()
       
    ) {
        self.router = router
//        self.service = service
    }
    
    // MARK: - Loading
//    func putAvatar(image: UIImage) {
//        print("sended avatar")
//        cancellable = service.putAvatar(image: image)
//            .sink(receiveCompletion: { completion in
//                print(completion)
//            }, receiveValue: { result in
//                print(result)
//            })
//    }
    
    
    
    // MARK: - Routing
    
    
    
}
