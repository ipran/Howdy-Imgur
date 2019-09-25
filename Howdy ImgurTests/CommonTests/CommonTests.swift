//
//  CommonTests.swift
//  Howdy ImgurTests
//
//  Created by Pranil V P on 24/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import XCTest
@testable import Howdy_Imgur


class CommonTests: XCTestCase {
    
    var expectation: XCTestExpectation?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testDateTimeStringValue()  {
        let stringValue = 1569371786.dateTimeStringValue()
        assert(stringValue == "25-09-2019 12:36 AM", "Time stamp conversion failed")
        
    }
    
    func testHomeTableViewCellIdentifier() {
        let tableViewCellIdentifier = GalleryImageTableViewCell.identifier
        assert(tableViewCellIdentifier == "GalleryImageTableViewCell", "Gallery image tableview cell identifier test failed")
        
    }

}
