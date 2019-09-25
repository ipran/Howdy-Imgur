//
//  APIResponse.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

enum APIResponse <T,U> where U: Error {
    case success(T)
    case failure(U)
    
}

enum APIError: Error {
    case requestFailed
    case jsonConversionFailure
    case invalidData
    case responseUnsuccessful
    case jsonParsingFailure
    
    var localizedDescription: String {
        switch self {
        case .requestFailed: return ImgurMessages.requestFailed
        case .invalidData: return ImgurMessages.invalidData
        case .responseUnsuccessful: return ImgurMessages.responseUnsuccessful
        case .jsonParsingFailure: return ImgurMessages.jsonParsingFailure
        case .jsonConversionFailure: return ImgurMessages.jsonParsingFailure
            
        }
        
    }
    
}
