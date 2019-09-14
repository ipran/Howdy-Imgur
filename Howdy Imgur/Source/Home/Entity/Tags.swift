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
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case display_name = "display_name"
        case followers = "followers"
        case total_items = "total_items"
        case following = "following"
        case is_whitelisted = "is_whitelisted"
        case background_hash = "background_hash"
        case thumbnail_hash = "thumbnail_hash"
        case accent = "accent"
        case background_is_animated = "background_is_animated"
        case thumbnail_is_animated = "thumbnail_is_animated"
        case is_promoted = "is_promoted"
        case description = "description"
        case logo_hash = "logo_hash"
        case logo_destination_url = "logo_destination_url"
        case description_annotations = "description_annotations"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        display_name = try values.decodeIfPresent(String.self, forKey: .display_name)
        followers = try values.decodeIfPresent(Int.self, forKey: .followers)
        total_items = try values.decodeIfPresent(Int.self, forKey: .total_items)
        following = try values.decodeIfPresent(Bool.self, forKey: .following)
        is_whitelisted = try values.decodeIfPresent(Bool.self, forKey: .is_whitelisted)
        background_hash = try values.decodeIfPresent(String.self, forKey: .background_hash)
        thumbnail_hash = try values.decodeIfPresent(String.self, forKey: .thumbnail_hash)
        accent = try values.decodeIfPresent(String.self, forKey: .accent)
        background_is_animated = try values.decodeIfPresent(Bool.self, forKey: .background_is_animated)
        thumbnail_is_animated = try values.decodeIfPresent(Bool.self, forKey: .thumbnail_is_animated)
        is_promoted = try values.decodeIfPresent(Bool.self, forKey: .is_promoted)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        logo_hash = try values.decodeIfPresent(String.self, forKey: .logo_hash)
        logo_destination_url = try values.decodeIfPresent(String.self, forKey: .logo_destination_url)
        description_annotations = try values.decodeIfPresent(Description_annotations.self, forKey: .description_annotations)
        
    }
    
}

// MARK: - Description_annotations
struct Description_annotations : Codable {
    
}
