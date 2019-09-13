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
    case failiure(U)
    
}
