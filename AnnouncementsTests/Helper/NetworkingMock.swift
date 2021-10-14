//
//  NetworkingMock.swift
//  AnnouncementsTests
//
//  Created by sofiene on 14/10/2021.
//

import XCTest
@testable import Announcements

class NetworkLayerMock: Networking {
    
    let api: String
    init(_ api: String){
        self.api = api
    }
    override func fetch<T>(_ endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        let url = Bundle(for: type(of: self)).url(forResource: self.api, withExtension: "json")!
        guard let jsonData = try? Data(contentsOf:url) else { return }
        //manage date
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let entries = try decoder.decode(T.self, from: jsonData)
            completion(.success(entries))
        } catch {
            XCTFail("Import fail: \(error)")
        }
    }
    
}
