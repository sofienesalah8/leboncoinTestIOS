//
//  Announcement.swift
//  Announcements
//
//  Created by Sofiene Salah on 11/10/2021.
//

import Foundation

struct Announcement: Codable {
    let id:Int
    let category_id:Int
    let title:String
    let description: String
    let price:Int
    let images_url:Image
    let creation_date: Date
    let is_urgent: Bool
}
