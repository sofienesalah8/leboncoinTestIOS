//
//  AnnouncementsViewModel.swift
//  Announcements
//
//  Created by sofiene on 12/10/2021.
//

import Foundation

class AnnouncementsViewModel {
    
    let service: AnnoucementsProvider
    typealias onAnnouncementsUpdate = (Result<[Announcement], Error>) -> Void
    
    init(service: AnnoucementsProvider) {
        self.service = service
    }
    
    //fetch by catagorie if 0 get all announcements.
    func fetchByCategorie(cat: Int,completion: @escaping onAnnouncementsUpdate) {
        service.getAnnouncements{ result in
            
            var array: [Announcement] = []
            do {
                array = try result.get()
                if (cat == 0){
                    array = self.sortedAnnouncements(announcements: array)
                }
                else{
                    array = self.sortedAnnouncements(announcements: array).filter { (announcement) -> Bool in
                        return announcement.category_id == cat
                    }
                }
                completion(.success(array))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    //Sorted by Is urgent and Date
    private func sortedAnnouncements(announcements: [Announcement]) -> [Announcement]{
        let result = announcements.sorted { (arg0, arg1) -> Bool in
            if arg0.is_urgent == arg1.is_urgent {
                return arg0.creation_date.compare(arg1.creation_date) == .orderedDescending
            }
            return arg0.is_urgent && !arg1.is_urgent
        }
        return result
    }
}
