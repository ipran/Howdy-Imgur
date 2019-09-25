//
//  ImgurConstants.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

struct ImgurContants {
    static let howdyImgur = "Howdy Imgur"
    static let homeTableViewCellHeight = 400
    
}

// Hold storyboard name constants
struct ImgurStoryboard {
    static let home = "Home"
    
}

struct ImgurURLConstants {
    static let baseURL = "https://api.imgur.com"
    static let gallerySearchPath = "/3/gallery/search/top/week"
    static let queryParamSerachKeyName = "q"
    
}

struct HTTPHeaderField {
    static let authorizationHeaderFieldKey = "Authorization"
    static let authorizationHeaderFieldValue = "Client-ID 078930952d507dc"
    
}

struct ImgurMessages {
    static let noImagesFound = "No Images found for the given input!"
    static let somethingWentWrong = "Something went wrong!"
    static let noResultForSearch = "Sorry, we did not find any results for your search."
    static let appInfo = "Search for the top images of the week from the imgur gallery."
    static let appInfoWhenToggleOn = "Switch to 'Less' for displaying results fewer in number."
    static let requestFailed = "Sorry, couldn't communicate with Imgur server. Please check your network connection."
    static let invalidData = "The operation couldn't be completed. Invalid response"
    static let responseUnsuccessful = "Response Unsuccessful. There was an error connecting to the Imgur server"
    static let jsonParsingFailure = "Something's gone wrong with your request"
    
}

// Accessibility Identifier for UITesting
struct ImgurAccessibilityIdentifier {
    static let homeTableView = "HomeTableView"
    static let toggleSwitch = "ToggleSwitch"
    static let segmnetAllLabel = "All"
    static let tableViewCellIamge = "Cell Image"
    
}

// Show/Hide log details
let logActivity = true
