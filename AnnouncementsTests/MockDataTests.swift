//
//  MockDataTests.swift
//  AnnouncementsTests
//
//  Created by sofiene on 14/10/2021.
//

import XCTest
@testable import Announcements

class AdvertTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    //here i test all models and test the decode mecanism
    func testInitAnnounce() {
        let url = Bundle(for: type(of: self)).url(forResource: "listing", withExtension: "json")!
        let jsonData = try? Data(contentsOf:url)
        //manage date
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        XCTAssertNoThrow(try decoder.decode([Announcement].self, from: jsonData!))
    }
    
    func testInitCategorie() {
         let url = Bundle(for: type(of: self)).url(forResource: "categories", withExtension: "json")!
        let jsonData = try? Data(contentsOf:url)
        XCTAssertNoThrow(try JSONDecoder().decode([Categorie].self, from: jsonData!))
    }

}
