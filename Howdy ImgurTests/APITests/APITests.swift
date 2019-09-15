//
//  APITests.swift
//  Howdy ImgurTests
//
//  Created by Pranil V P on 15/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import XCTest
@testable import Howdy_Imgur

class APITests: XCTestCase {
    
    var expectation: XCTestExpectation?
    
    override func setUp() {
        
    }
    // MARK: - Testing homedata API
    func testHomeDataAPI() {
        self.expectation = XCTestExpectation(description: "Fetching home data..")
        let homeViewInteractor = HomeViewInteractor(presenter:self)
        homeViewInteractor.fetchImageList(searchKey: "Test")
        wait(for: [expectation!], timeout: 20)
        
    }
    override func tearDown() {
        expectation = nil
        
    }
    
}

extension APITests: HomeViewOutputInteractorProtocol {
    func imageListDidFetch(gallery: ImgurGallery?) {
        // Testing whether API is giving data
        XCTAssert(((gallery?.data) != nil), "Home API failed")
        guard let data = gallery?.data else {
            return
            
        }
        // For testing whether necessary fields are getting from API
        for gallery in data {
            XCTAssertFalse(gallery.title!.isEmpty, "Gallery with empty title")
            
        }
        expectation?.fulfill()
        
    }
    func imageListDidFetchFailed(error: Error?) {
        XCTFail((error as? APIError)?.localizedDescription ?? "Home API Failed")
        expectation?.fulfill()
        
    }
    
}
