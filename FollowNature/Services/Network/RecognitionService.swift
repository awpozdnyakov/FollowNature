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

//struct AuthPlugin: PluginType {
//    let token: String
//
//    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
//        var request = request
//        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
//        return request
//    }
//}

protocol RecognitionService {
    func postFormdataPhoto(photo: UIImage) -> AnyPublisher<FormdataIdentificationModel, MoyaError>
    func postBase64Photo(photo: PhotoBase64Model) -> AnyPublisher<Base64IdentificationModel, MoyaError>
}

final class RecognitionServiceImpl: RecognitionService {
    
    private let provider = MoyaProvider<RecognitionRequestCollection>()
    
    func postFormdataPhoto(photo: UIImage) -> AnyPublisher<FormdataIdentificationModel, MoyaError> {
        let decoder = JSONDecoder()
        
        return provider.requestPublisher(.photoFormdata(photo: photo))
            .map(FormdataIdentificationModel.self, using: decoder)
            .eraseToAnyPublisher()
    }
    
    func postBase64Photo(photo: PhotoBase64Model) -> AnyPublisher<Base64IdentificationModel, MoyaError> {
        let decoder = JSONDecoder()
        
        return provider.requestPublisher(.photoBase64(photo: photo))
            .map(Base64IdentificationModel.self, using: decoder)
            .eraseToAnyPublisher()
    }
}
