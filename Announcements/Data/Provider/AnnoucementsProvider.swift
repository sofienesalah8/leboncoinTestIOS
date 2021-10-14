//
//  AnnoucementsProvider.swift
//  Announcements
//
//  Created by sofiene on 12/10/2021.
//

import Foundation

protocol AnnoucementsProviderProtocol {
    func getAnnouncements(_ completion: @escaping (Result<[Announcement], Error>) -> Void)
}

class AnnoucementsProvider: AnnoucementsProviderProtocol {
    let network: Networking
    
    init(network: Networking = Networking()) {
        self.network = network
    }
    
    func getAnnouncements(_ completion: @escaping (Result<[Announcement], Error>) -> Void) {
        network.fetch(.announcementURL, completion: completion)
    }
}
