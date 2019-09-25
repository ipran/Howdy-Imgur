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
    // MARK: - Testing homedata API using interactor
    func testHomeDataAPI() {
        self.expectation = XCTestExpectation(description: "Fetching home data by calling Imgur API using interactor")
        let homeViewInteractor = HomeViewInteractor(presenter:self)
        homeViewInteractor.fetchImageList(searchKey: "happy")
        wait(for: [expectation!], timeout: 30)
        
    }
    // MARK: - Testing fetching data from Imgur server
    func testFetchingImageListAPI() {
        self.expectation = XCTestExpectation(description: "Fetch data from Imgur server")
        let apiManager = ImgurAPIManager()
        apiManager.fetchDataforInputText(queryParameter: "happy") { (response) in
            
            switch(response) {
                
            case let .failure(error) :
                print(error.localizedDescription)
                XCTFail()
                
            case let .success(result) :
                XCTAssertNotNil(result.status, "Fetching data from server successfull")
                
            }
            
            self.expectation?.fulfill()
            
        }
        wait(for: [self.expectation!], timeout: 30)
        
    }
    override func tearDown() {
        expectation = nil
        
    }
    
}

extension APITests: HomeViewOutputInteractorProtocol {
    func filteredImageListDidFetch(gallery: [Gallery]?) {
        // Testing whether image array is getting filtered
        XCTAssert((gallery != nil), "Filtering data failed")
        guard let gallery = gallery else {
            return
            
        }
        // For testing whether necessary fields there in the data array
        for data in gallery {
            XCTAssertFalse(data.title!.isEmpty, "Gallery with empty title")
            
        }
        expectation?.fulfill()
        
    }
    func imageListDidFetch(gallery: [Gallery]?) {
        // Testing whether API is giving data
        XCTAssert((gallery != nil), "Home API failed")
        guard let gallery = gallery else {
            return
            
        }
        // For testing whether necessary fields are getting from API
        for data in gallery {
            XCTAssertFalse(data.title!.isEmpty, "Gallery with empty title")
            
        }
        expectation?.fulfill()
        
    }
    func imageListDidFetchFailed(error: Error?) {
        XCTFail((error as? APIError)?.localizedDescription ?? "Home API Failed")
        expectation?.fulfill()
        
    }
    
}
