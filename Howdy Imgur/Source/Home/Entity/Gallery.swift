//
//  Gallery.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

// MARK: - Gallery
struct Gallery: Codable {
    var data: [Datum]
    var success: Bool
    var status: Int
}

// MARK: - Datum
struct Datum: Codable {
    var id, title: String
    var datumDescription: String?
    var datetime: Int
    var cover: String?
    var coverWidth, coverHeight: Int?
    var accountURL: String
    var accountID: Int
    var privacy: Privacy?
    var layout: Layout?
    var views: Int
    var link: String
    var ups, downs, points, score: Int
    var isAlbum: Bool
    var vote: JSONNull?
    var favorite, nsfw: Bool
    var section: Section
    var commentCount, favoriteCount: Int
    var topic: Topic
    var topicID: Int
    var imagesCount: Int?
    var inGallery, isAd: Bool
    var tags: [Tag]
    var adType: Int
    var adURL: String
    var inMostViral: Bool
    var includeAlbumAds: Bool?
    var images: [Image]?
    var adConfig: AdConfig
    var type: TypeEnum?
    var animated: Bool?
    var width, height, size, bandwidth: Int?
    var hasSound: Bool?
    var edited: Int?
    var mp4: String?
    var gifv: String?
    var hls: String?
    var mp4Size: Int?
    var looping: Bool?
    var processing: Processing?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case datumDescription = "description"
        case datetime, cover
        case coverWidth = "cover_width"
        case coverHeight = "cover_height"
        case accountURL = "account_url"
        case accountID = "account_id"
        case privacy, layout, views, link, ups, downs, points, score
        case isAlbum = "is_album"
        case vote, favorite, nsfw, section
        case commentCount = "comment_count"
        case favoriteCount = "favorite_count"
        case topic
        case topicID = "topic_id"
        case imagesCount = "images_count"
        case inGallery = "in_gallery"
        case isAd = "is_ad"
        case tags
        case adType = "ad_type"
        case adURL = "ad_url"
        case inMostViral = "in_most_viral"
        case includeAlbumAds = "include_album_ads"
        case images
        case adConfig = "ad_config"
        case type, animated, width, height, size, bandwidth
        case hasSound = "has_sound"
        case edited, mp4, gifv, hls
        case mp4Size = "mp4_size"
        case looping, processing
    }
    
}
