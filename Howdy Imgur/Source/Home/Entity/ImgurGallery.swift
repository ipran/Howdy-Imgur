//
//  Gallery.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

// MARK: - ImgurGallery
struct ImgurGallery : Codable {
    var data : [Gallery]?
    var success : Bool?
    var status : Int?
    
}

// MARK: - Gallery
struct Gallery : Codable {
    init() {}
    var id : String?
    var title : String?
    var description : String?
    var datetime : Int?
    var cover : String?
    var cover_width : Int?
    var cover_height : Int?
    var account_url : String?
    var account_id : Int?
    var privacy : String?
    var layout : String?
    var views : Int?
    var link : String?
    var ups : Int?
    var downs : Int?
    var points : Int?
    var score : Int?
    var is_album : Bool?
    var vote : String?
    var favorite : Bool?
    var nsfw : Bool?
    var section : String?
    var comment_count : Int?
    var favorite_count : Int?
    var topic : String?
    var topic_id : Int?
    var images_count : Int?
    var in_gallery : Bool?
    var is_ad : Bool?
    var tags : [Tags]?
    var ad_type : Int?
    var ad_url : String?
    var in_most_viral : Bool?
    var include_album_ads : Bool?
    var images : [Images]?
    var ad_config : Ad_config?
    
}
