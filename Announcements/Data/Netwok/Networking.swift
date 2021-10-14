//
//  Networking.swift
//  Announcements
//
//  Created by sofiene on 12/10/2021.
//

import Foundation

protocol NetworkingProtocol {
    func fetch<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void)
}

class Networking: NetworkingProtocol {
    
    init() {
        //nothing
    }
    
    func fetch<T: Decodable>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        let urlRequest = endpoint.urlRequest
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            do {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    preconditionFailure("No error was received")
                }
                //manage date
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let decoded = try decoder.decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
