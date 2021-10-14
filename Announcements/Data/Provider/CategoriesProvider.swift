//
//  CategoriesProvider.swift
//  Announcements
//
//  Created by sofiene on 14/10/2021.
//

import Foundation

protocol CategoriesProviderProtocol {
    func  getCategories(_ completion: @escaping (Result<[Categorie], Error>) -> Void)
}

class CategoriesProvider: CategoriesProviderProtocol {
    
    let network: Networking
    
    init(network: Networking = Networking()) {
        self.network = network
    }
    
    func getCategories(_ completion: @escaping (Result<[Categorie], Error>) -> Void) {
        network.fetch(.categorieURL, completion: completion)
    }
}
