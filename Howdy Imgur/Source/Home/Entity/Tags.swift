//
//  Tag.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

// MARK: - Tags
struct Tags : Codable {
    let name : String?
    let display_name : String?
    let followers : Int?
    let total_items : Int?
    let following : Bool?
    let is_whitelisted : Bool?
    let background_hash : String?
    let thumbnail_hash : String?
    let accent : String?
    let background_is_animated : Bool?
    let thumbnail_is_animated : Bool?
    let is_promoted : Bool?
    let description : String?
    let logo_hash : String?
    let logo_destination_url : String?
    let description_annotations : Description_annotations?
    
}

// MARK: - Description_annotations
struct Description_annotations : Codable {
    
}
