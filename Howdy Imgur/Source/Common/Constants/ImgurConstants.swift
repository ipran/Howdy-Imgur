//
//  ImgurConstants.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

// Log Details
let logActivity = true

struct ImgurURLConstants {
    static let baseURL = "https://api.imgur.com"
    static let gallerySearchPath = "/3/gallery/search/top/week/1"
    static let queryParamSerachKeyName = "q"
    
}

struct HTTPHeaderField {
    static let authorizationHeaderFieldKey = "Authorization"
    static let authorizationHeaderFieldValue = "Client-ID 078930952d507dc"
    
}
