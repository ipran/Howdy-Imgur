//
//  ImgurAPIManager.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

class ImgurAPIManager: BaseAPIManager {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
        
    }
    convenience init() {
        self.init(configuration: .default)
        
    }
    /**
    Fetch home data based on input text
    */
    func fetchDataforInputText(queryParameter: String, completion: @escaping(APIResponse<Gallery,APIError>) -> Void) {
        let endpoint = ImgurFeed.gallerySearch(queryParam: queryParameter)
        var request = endpoint.request
        request.method = HTTPMethod.get
        fetch(with: request, decode: { json -> Gallery? in
            guard let galleryResult = json as? Gallery else { return nil }
            return galleryResult
        }, completion: completion)
        
    }
    
}
