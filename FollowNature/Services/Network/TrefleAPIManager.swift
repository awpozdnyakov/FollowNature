//
//  UrlServiceImpl.swift
//  FollowNature
//
//  Created by Shamil Aglarov on 18.10.2023.
//

import Foundation

class TrefleAPIManager {
    
    static let shared = TrefleAPIManager()
    
    private let session = URLSession.shared
    private let token = "kZL4jkIYJClj3W2kdJw7HapP5VwidXNDuG0PiKsIXV4"
    private let baseURL = "https://trefle.io/api/v1"
    
    init() {}

    func searchPlantByName<T: Decodable>(_ plantName: String, completion: @escaping (Result<T, Error>) -> Void) {
        switch createSearchPlantRequest(plantName) {
        case .success(let request):
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    completion(.failure(ApiError.invalidData))
                    return
                }
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        case .failure(let error):
            completion(.failure(error))
        }
    }

    private func createSearchPlantRequest(_ plantName: String) -> Result<URLRequest, Error> {
        var components = URLComponents(string: "\(baseURL)/plants/search")
        components?.queryItems = [
            URLQueryItem(name: "q", value: plantName),
            URLQueryItem(name: "token", value: token)
        ]
        
        guard let url = components?.url else {
            return .failure(ApiError.invalidURL)
        }
        
        return .success(URLRequest(url: url))
    }
}

enum ApiError: Error {
    case invalidURL
    case invalidData
}
