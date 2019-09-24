//
//  Image.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

// MARK: - Images
struct Images : Codable {
    let id : String?
    let title : String?
    let description : String?
    let datetime : Int?
    let type : String?
    let animated : Bool?
    let width : Int?
    let height : Int?
    let size : Int?
    let views : Int?
    let bandwidth : Int?
    let vote : String?
    let favorite : Bool?
    let nsfw : String?
    let section : String?
    let account_url : String?
    let account_id : String?
    let is_ad : Bool?
    let in_most_viral : Bool?
    let has_sound : Bool?
    let tags : [String]?
    let ad_type : Int?
    let ad_url : String?
    let edited : String?
    let in_gallery : Bool?
    let link : String?
    let comment_count : String?
    let favorite_count : String?
    let ups : String?
    let downs : String?
    let points : String?
    let score : String?
    
}

// MARK: - AdConfig
struct Ad_config : Codable {
    let safeFlags : [String]?
    let highRiskFlags : [String]?
    let unsafeFlags : [String]?
    let showsAds : Bool?
    
}





