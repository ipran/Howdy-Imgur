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
        case .requestFailed: return "Howdy_Imgur APIError : Cannot connect to Imgur Server"
        case .invalidData: return "Howdy_Imgur APIError : Invalid Data"
        case .responseUnsuccessful: return "Howdy_Imgur APIError : Response Unsuccessful"
        case .jsonParsingFailure: return "Howdy_Imgur APIError : JSON Parsing Failure"
        case .jsonConversionFailure: return "Howdy_Imgur APIError : JSON Conversion Failure"
            
        }
        
    }
    
}
