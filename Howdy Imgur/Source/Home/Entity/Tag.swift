//
//  Tag.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

// MARK: - Tag
struct Tag: Codable {
    var name, displayName: String
    var followers, totalItems: Int
    var following, isWhitelisted: Bool
    var backgroundHash: String
    var thumbnailHash, accent: String?
    var backgroundIsAnimated, thumbnailIsAnimated, isPromoted: Bool
    var tagDescription: Description
    var logoHash, logoDestinationURL: JSONNull?
    var descriptionAnnotations: DescriptionAnnotations
    
    enum CodingKeys: String, CodingKey {
        case name
        case displayName = "display_name"
        case followers
        case totalItems = "total_items"
        case following
        case isWhitelisted = "is_whitelisted"
        case backgroundHash = "background_hash"
        case thumbnailHash = "thumbnail_hash"
        case accent
        case backgroundIsAnimated = "background_is_animated"
        case thumbnailIsAnimated = "thumbnail_is_animated"
        case isPromoted = "is_promoted"
        case tagDescription = "description"
        case logoHash = "logo_hash"
        case logoDestinationURL = "logo_destination_url"
        case descriptionAnnotations = "description_annotations"
        
    }
    
}

// MARK: - DescriptionAnnotations
struct DescriptionAnnotations: Codable {
    
}

enum Description: String, Codable {
    case allThingsAnimal = "all things animal"
    case bootsOnTrails = "boots on trails"
    case cuteAndAdorable = "cute and adorable"
    case empty = ""
    case felineFriends = "feline friends"
    case humanSBestFriend = "human's best friend"
    case loLsROFLsLMAOS = "LOLs, ROFLs, LMAOs"
    case neatAndAmazing = "neat and amazing"
    case rescueDogAppreciationDayJuly11Th2019 = "Rescue Dog Appreciation Day - July 11th 2019"
    case theFreshestMemes = "the freshest memes"
    case theGreatOutdoors = "the great outdoors"
    case videosWithSound = "videos with sound"
    case weirdWildWhy = "weird, wild, why?"
    
}

enum Topic: String, Codable {
    case noTopic = "No Topic"
    
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
        
    }
    public var hashValue: Int {
        return 0
    }
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            
        }
        
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
        
    }
    
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
        
    }
    required init?(stringValue: String) {
        key = stringValue
        
    }
    var intValue: Int? {
        return nil
        
    }
    var stringValue: String {
        return key
        
    }
    
}
