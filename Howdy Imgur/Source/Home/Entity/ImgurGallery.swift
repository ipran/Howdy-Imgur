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
    init() {}
    var data : [Gallery]?
    var success : Bool?
    var status : Int?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
        case success = "success"
        case status = "status"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([Gallery].self, forKey: .data)
        success = try values.decodeIfPresent(Bool.self, forKey: .success)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        
    }
    
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
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case datetime = "datetime"
        case cover = "cover"
        case cover_width = "cover_width"
        case cover_height = "cover_height"
        case account_url = "account_url"
        case account_id = "account_id"
        case privacy = "privacy"
        case layout = "layout"
        case views = "views"
        case link = "link"
        case ups = "ups"
        case downs = "downs"
        case points = "points"
        case score = "score"
        case is_album = "is_album"
        case vote = "vote"
        case favorite = "favorite"
        case nsfw = "nsfw"
        case section = "section"
        case comment_count = "comment_count"
        case favorite_count = "favorite_count"
        case topic = "topic"
        case topic_id = "topic_id"
        case images_count = "images_count"
        case in_gallery = "in_gallery"
        case is_ad = "is_ad"
        case tags = "tags"
        case ad_type = "ad_type"
        case ad_url = "ad_url"
        case in_most_viral = "in_most_viral"
        case include_album_ads = "include_album_ads"
        case images = "images"
        case ad_config = "ad_config"
        
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        datetime = try values.decodeIfPresent(Int.self, forKey: .datetime)
        cover = try values.decodeIfPresent(String.self, forKey: .cover)
        cover_width = try values.decodeIfPresent(Int.self, forKey: .cover_width)
        cover_height = try values.decodeIfPresent(Int.self, forKey: .cover_height)
        account_url = try values.decodeIfPresent(String.self, forKey: .account_url)
        account_id = try values.decodeIfPresent(Int.self, forKey: .account_id)
        privacy = try values.decodeIfPresent(String.self, forKey: .privacy)
        layout = try values.decodeIfPresent(String.self, forKey: .layout)
        views = try values.decodeIfPresent(Int.self, forKey: .views)
        link = try values.decodeIfPresent(String.self, forKey: .link)
        ups = try values.decodeIfPresent(Int.self, forKey: .ups)
        downs = try values.decodeIfPresent(Int.self, forKey: .downs)
        points = try values.decodeIfPresent(Int.self, forKey: .points)
        score = try values.decodeIfPresent(Int.self, forKey: .score)
        is_album = try values.decodeIfPresent(Bool.self, forKey: .is_album)
        vote = try values.decodeIfPresent(String.self, forKey: .vote)
        favorite = try values.decodeIfPresent(Bool.self, forKey: .favorite)
        nsfw = try values.decodeIfPresent(Bool.self, forKey: .nsfw)
        section = try values.decodeIfPresent(String.self, forKey: .section)
        comment_count = try values.decodeIfPresent(Int.self, forKey: .comment_count)
        favorite_count = try values.decodeIfPresent(Int.self, forKey: .favorite_count)
        topic = try values.decodeIfPresent(String.self, forKey: .topic)
        topic_id = try values.decodeIfPresent(Int.self, forKey: .topic_id)
        images_count = try values.decodeIfPresent(Int.self, forKey: .images_count)
        in_gallery = try values.decodeIfPresent(Bool.self, forKey: .in_gallery)
        is_ad = try values.decodeIfPresent(Bool.self, forKey: .is_ad)
        tags = try values.decodeIfPresent([Tags].self, forKey: .tags)
        ad_type = try values.decodeIfPresent(Int.self, forKey: .ad_type)
        ad_url = try values.decodeIfPresent(String.self, forKey: .ad_url)
        in_most_viral = try values.decodeIfPresent(Bool.self, forKey: .in_most_viral)
        include_album_ads = try values.decodeIfPresent(Bool.self, forKey: .include_album_ads)
        images = try values.decodeIfPresent([Images].self, forKey: .images)
        ad_config = try values.decodeIfPresent(Ad_config.self, forKey: .ad_config)
        
    }
    
}
