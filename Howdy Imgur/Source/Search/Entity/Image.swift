//
//  Image.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

// MARK: - Image
struct Image: Codable {
    var id: String
    var title: JSONNull?
    var imageDescription: String?
    var datetime: Int
    var type: TypeEnum
    var animated: Bool
    var width, height, size, views: Int
    var bandwidth: Int
    var vote: JSONNull?
    var favorite: Bool
    var nsfw, section, accountURL, accountID: JSONNull?
    var isAd, inMostViral, hasSound: Bool
    var tags: [Tag]
    var adType: Int
    var adURL, edited: String
    var inGallery: Bool
    var link: String
    var mp4Size: Int?
    var mp4: String?
    var gifv: String?
    var hls: String?
    var processing: Processing?
    var commentCount, favoriteCount, ups, downs: JSONNull?
    var points, score: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case imageDescription = "description"
        case datetime, type, animated, width, height, size, views, bandwidth, vote, favorite, nsfw, section
        case accountURL = "account_url"
        case accountID = "account_id"
        case isAd = "is_ad"
        case inMostViral = "in_most_viral"
        case hasSound = "has_sound"
        case tags
        case adType = "ad_type"
        case adURL = "ad_url"
        case edited
        case inGallery = "in_gallery"
        case link
        case mp4Size = "mp4_size"
        case mp4, gifv, hls, processing
        case commentCount = "comment_count"
        case favoriteCount = "favorite_count"
        case ups, downs, points, score
        
    }
    
}

// MARK: - AdConfig
struct AdConfig: Codable {
    var safeFlags: [SafeFlag]
    var highRiskFlags: [HighRiskFlag]
    var unsafeFlags: [UnsafeFlag]
    var showsAds: Bool
    
}

enum HighRiskFlag: String, Codable {
    case ageGate = "age_gate"
    case notInGallery = "not_in_gallery"
    case subreddit = "subreddit"
    
}

enum SafeFlag: String, Codable {
    case album = "album"
    case gallery = "gallery"
    case inGallery = "in_gallery"
    case onsfwModSafe = "onsfw_mod_safe"
    case pageLoad = "page_load"
    case sixthModSafe = "sixth_mod_safe"
    
}

enum UnsafeFlag: String, Codable {
    case mature = "mature"
    case onsfwModUnsafe = "onsfw_mod_unsafe"
    case sixthModUnsafe = "sixth_mod_unsafe"
    case under10 = "under_10"
    
}

// MARK: - Processing
struct Processing: Codable {
    let status: Status
    
}

enum Status: String, Codable {
    case completed = "completed"
    
}

enum TypeEnum: String, Codable {
    case imageGIF = "image/gif"
    case imageJPEG = "image/jpeg"
    case imagePNG = "image/png"
    case videoMp4 = "video/mp4"
    
}

enum Layout: String, Codable {
    case blog = "blog"
    
}

enum Privacy: String, Codable {
    case hidden = "hidden"
    
}

enum Section: String, Codable {
    case animalsBeingDerps = "AnimalsBeingDerps"
    case aww = "aww"
    case combatFootage = "CombatFootage"
    case empty = ""
    case rarepuppers = "rarepuppers"
    
}
