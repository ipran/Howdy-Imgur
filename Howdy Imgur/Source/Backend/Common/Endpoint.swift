//
//  Endpoint.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    
}

extension Endpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
        return components
        
    }
    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return request
        
    }
    
}

enum ImgurFeed {
    case gallerySearch(queryParam: String)
    
}

extension ImgurFeed: Endpoint {
    var base: String {
        return ImgurURLConstants.baseURL
        
    }
    var path: String {
        switch self {
        case .gallerySearch:
            return ImgurURLConstants.gallerySearchPath
            
        }
        
    }
    var method: HTTPMethod {
        return .post
        
    }
    var queryItems: [URLQueryItem] {
        switch self {
        case let .gallerySearch(queryParam):
            return [URLQueryItem(name: ImgurURLConstants.queryParamSerachKeyName, value: queryParam)]
            
        }
        
    }
    
}
