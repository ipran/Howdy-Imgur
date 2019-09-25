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
        homeViewController.presenter?.fetchImageList(with: "happy")
        wait(for: [expectation!], timeout: 30)
        
    }
    // MARK: - Home view Sort Gallery functionality test
    func testHomeGalleryDataFilteringFunctionality() {
        expectation = XCTestExpectation(description: "Test gallery is filtering based on checking whether 'points','score' and 'topic_id' add up to an even no.")
        
        var galleryArray = [Gallery]()
        
        var gallery1 = Gallery()
        gallery1.title = "Gallery 1"
        gallery1.points = 100
        gallery1.score = 200
        gallery1.topic_id = 100
        
        var gallery2 = Gallery()
        gallery2.title = "Gallery 2"
        gallery2.points = 200
        gallery2.score = 300
        gallery2.topic_id = 101
        
        galleryArray.append(gallery1)
        galleryArray.append(gallery2)
        
        homeViewController.presenter?.view = self
        homeViewController.presenter?.sortGalleryListForLessResult(with: galleryArray)
        wait(for: [expectation!], timeout: 20)
        
    }
    
    override func tearDown() {
        expectation?.fulfill()
        expectation = nil
        
    }
    
}

extension HomeViewTests: HomeViewProtocol {
    func showFilteredImageList(with gallery: [Gallery]) {
        // Testing whether Filtered array is giving data
        XCTAssert(gallery.count > 0, "Empty list")
        // For testing whether all necessary details getting from API
        for data in gallery {
            XCTAssertFalse(data.title!.isEmpty, "Gallery with empty title")
            
        }
        expectation?.fulfill()
        
    }
    func showImageList(with gallery: [Gallery]) {
        // Testing whether API is giving data
        XCTAssert(gallery.count > 0, "Empty list")
        // For testing whether all necessary details getting from API
        for data in gallery {
            XCTAssertFalse(data.title!.isEmpty, "Gallery with empty title")
            
        }
        expectation?.fulfill()
        
    }
    func showAPIError(message: String) {
        XCTFail(message)
        expectation?.fulfill()
        
    }
    
}
