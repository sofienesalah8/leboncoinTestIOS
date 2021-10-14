//
//  RequestProvider.swift
//  Announcements
//
//  Created by sofiene on 12/10/2021.
//

import Foundation

enum Endpoint {
    case announcementURL
    case categorieURL
}

protocol RequestProvider {
    var urlRequest: URLRequest { get }
}

extension Endpoint: RequestProvider {
    //here i define my endpoint
    var urlRequest: URLRequest {
        switch self {
        case .announcementURL:
            guard let url = URL(string: URLBase+WSListing) else {
                preconditionFailure("Invalid URL")
            }
            return URLRequest(url: url)
        case .categorieURL:
            guard let url = URL(string: URLBase+WSCategories) else {
                preconditionFailure("Invalid URL")
            }
            return URLRequest(url: url)
        }
    }
}
