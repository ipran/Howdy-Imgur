//
//  Howdy_ImgurTests.swift
//  Howdy ImgurTests
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import XCTest
@testable import Howdy_Imgur

class HomeViewTests: XCTestCase {
    
    var homeViewController: HomeViewController!
    var expectation: XCTestExpectation?
    override func setUp() {
        homeViewController = HomeViewController.instantiateViewController()
        HomeViewRouter.createHomeViewModule(homeViewRef: homeViewController)
        
    }
    // MARK: - Base Tests
    func testWhetherHomeModuleConfiguredCorrectly() {
        XCTAssertNotNil(homeViewController.presenter, "Presenter is nil")
        XCTAssertNotNil(homeViewController.presenter?.interactor, "Interactor is nil")
        XCTAssertNotNil(homeViewController.presenter?.router, "Router is nil")
        
    }
    // MARK: - Home view module integration test
    func testHomeDataFetching() {
        expectation = XCTestExpectation(description: "Fetch home data")
        homeViewController.presenter?.view = self
        homeViewController.presenter?.fetchImageList(with: "Test")
        wait(for: [expectation!], timeout: 20)
    }
    override func tearDown() {
        expectation?.fulfill()
        expectation = nil
        
    }
    
}

extension HomeViewTests: HomeViewProtocol {
    func showImageList(with gallery: Gallery) {
        // Testing whether API is giving data
        XCTAssert(gallery.data!.count > 0, "Empty list")
        // For testing whether all necessary details getting from API
        for gallery in gallery.data! {
            XCTAssertFalse(gallery.title!.isEmpty, "Gallery with empty title")
            
        }
        expectation?.fulfill()
        
    }
    func showAPIError(message: String) {
        XCTFail(message)
        expectation?.fulfill()
        
    }
    
}
