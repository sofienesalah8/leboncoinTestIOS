//
//  CategorieListViewModel.swift
//  Announcements
//
//  Created by sofiene on 12/10/2021.
//

import Foundation

class CategorieListViewModel {
    let service: CategoriesProvider
    typealias onCategoriesUpdate = (Result<[Categorie], Error>) -> Void
    
    init(service: CategoriesProvider) {
        self.service = service
    }
    
    //fetch by catagorie if 0 get all announcements.
    func fetchCategories(completion: @escaping onCategoriesUpdate) {
        service.getCategories{ result in
            var array: [Categorie] = []
            do {
                array = try result.get()
                completion(.success(array))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    //get categorie name
    func getCategorieName(by: Int, completion: @escaping (String) -> Void){
        var firstItem: Categorie?
        self.fetchCategories { result in
            switch result{
            case .success(let categories):
                firstItem = categories.first { (categorie) -> Bool in
                    return categorie.id == by
                }
                completion (firstItem?.name ?? "Non défini")
            case .failure(_):
                completion ("Non défini")
            }
            
            
        }
    }
}
