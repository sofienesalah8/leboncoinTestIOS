//
//  ALViewModelTests.swift
//  AnnouncementsTests
//
//  Created by sofiene on 14/10/2021.
//

import XCTest
@testable import Announcements

class ALViewModelTests: XCTestCase {
    
    var networkLayer: NetworkLayerMock!
    var providing: AnnoucementsProvider!
    
    override func setUp() {
        networkLayer = NetworkLayerMock("listing")
        providing = AnnoucementsProvider(network: networkLayer)
    }

    //to test the ViewModel function with the mock data
    func testfetchAnnouncementsMock(){
        let annListViewModel = AnnouncementsViewModel(service: providing)
        var actualData: [Announcement]?
        annListViewModel.fetchByCategorie(cat: 0) { result in
            switch result{
            case .success(let announcements):
                actualData = announcements
            XCTAssertTrue(announcements[0].id == 1547408955, "failed to fetch first announcement id")
            XCTAssertTrue(announcements[2].id == 1547403749, "failed to fetch third announcement id")
            case .failure(let error):
                XCTFail("Import fail: \(error)")
            }
        }
        XCTAssertNotNil(actualData)
    }

}
