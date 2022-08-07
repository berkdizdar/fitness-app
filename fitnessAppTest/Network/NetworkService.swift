//
//  NetworkService.swift
//  fitnessAppTest
//
//  Created by Berk Dizdar on 7.08.2022.
//

import Foundation

class NetworkService {
    static func fetchData<T: Decodable>(
        from urlComponents: String,
        response: T.Type,
        completionHandler completion: @escaping NetworkResult<T>
    ) {
        
        guard let url = URL(string: NetworkConstants.baseUrl.rawValue + urlComponents) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(response, from: data)
                completion(.success(jsonData))
                
            } catch {
                completion(.failure(error))
            }

        }
        .resume()
    }
}

extension NetworkService {
    typealias NetworkResult<U: Decodable> = (Result<U, Error>) -> Void
}
