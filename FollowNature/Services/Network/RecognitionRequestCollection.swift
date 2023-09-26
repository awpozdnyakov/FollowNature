//
//  RecognitionRequestCollection.swift
//  FollowNature
//
//  Created by Andrey Pozdnyakov on 22.09.2023.
//

import Foundation
import Moya
import UIKit

enum RecognitionRequestCollection {
    case photoFormdata(photo: UIImage)
    case photoBase64(photo: PhotoBase64Model)
}

extension RecognitionRequestCollection: TargetType {
    
    var baseURL: URL {URL(string: Constants.shared.baseURL)!}
    
    var path: String {
        switch self {
        case .photoFormdata:
            return "/api/v3/identification"
        case .photoBase64:
            return "/api/v3/identification"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .photoFormdata:
            return .post
        case .photoBase64:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .photoFormdata(let photo):
            let imageData = photo.jpegData(compressionQuality: 0.7)!
            let formData: [Moya.MultipartFormData] = [Moya.MultipartFormData(provider: .data(imageData), name: "image", fileName: "asds.png", mimeType: "image/jpeg")]
            
            return .uploadCompositeMultipart(formData, urlParameters: ["details": "common_names,url,description,taxonomy,rank,gbif_id,inaturalist_id,image,synonyms,edible_parts,watering,propagation_methods"])
        case .photoBase64(photo: let photo):
            return .requestJSONEncodable(photo)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "multipart/form-data",
                "Api-Key": Constants.shared.apiKey]
    }
}
