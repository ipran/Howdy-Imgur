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
    static let baseURL = "https://api.imgur.com/3"
    static let gallerySearchPath = "/search/top/week/1"
    static let queryParamSerachKeyName = "k"
    
}

struct HTTPHeaderField {
    static let authorizationHeaderFieldKey = "Authorization"
    static let authorizationHeaderFieldValue = "Client-ID 078930952d507dc"
    
}
