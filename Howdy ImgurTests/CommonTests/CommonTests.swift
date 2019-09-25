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
    
    func testLocalizedDescriptionForAPIError() {
        let errorString = "Sorry, couldn't communicate with Imgur server. Please check your network connection."
        assert(errorString == APIError.requestFailed.localizedDescription, "localized description of request failed APIError value is wrong")
        
    }
//    func testTextFieldDelegateTesting() {
//        let stringValue = "hi"
//        let textField = UITextField()
//        textField.text = stringValue
//        let homeViewController = UIStoryboard.home().instantiateViewController(withIdentifier: HomeViewController.identifier) as! HomeViewController
//        let value = homeViewController.textFieldShouldReturn(textField)
//        assert(value == true, "Failiure")
//    }
    
    func testImageDownloaded() {
        let imgur_founder_image = #imageLiteral(resourceName: "placeholder")
        let imageView = UIImageView()
        let url = URL(string: "https://image.flaticon.com/icons/png/512/214/214333.png")
        imageView.loadImageFrom(url!)
        print(imageView.image!)
        assert(imgur_founder_image == imageView.image , "error")
        
    }
    
}
