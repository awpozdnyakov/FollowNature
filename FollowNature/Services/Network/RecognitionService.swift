//
//  RecognitionService.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import Foundation
import Moya
import Combine
import CombineMoya
import UIKit

protocol RecognitionService {
    func postFormdataPhoto(photo: UIImage) -> AnyPublisher<FormdataResponseModel, MoyaError>
    func postBase64Photo(photo: PhotoBase64Model) -> AnyPublisher<Base64ResponseModel, MoyaError>
}

final class RecognitionServiceImpl: RecognitionService {
    
    private let provider = MoyaProvider<RecognitionRequestCollection>()
    
    func postFormdataPhoto(photo: UIImage) -> AnyPublisher<FormdataResponseModel, MoyaError> {
        let decoder = JSONDecoder()
        
        return provider.requestPublisher(.photoFormdata(photo: photo))
            .map(FormdataResponseModel.self, using: decoder)
            .eraseToAnyPublisher()
    }
    
    func postBase64Photo(photo: PhotoBase64Model) -> AnyPublisher<Base64ResponseModel, MoyaError> {
        let decoder = JSONDecoder()
        
        return provider.requestPublisher(.photoBase64(photo: photo))
            .map(Base64ResponseModel.self, using: decoder)
            .eraseToAnyPublisher()
    }
}
