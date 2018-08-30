//
//  FacebookFeed.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 27/08/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let FacebookFeed = try? newJSONDecoder().decode(FacebookFeed.self, from: jsonData)

import Foundation

struct FacebookFeed: Codable {
    let posts: [Post]
    let paging: Paging
    
    enum CodingKeys: String, CodingKey {
        case posts = "data"
        case paging
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.posts = try container.decode([Post].self, forKey: .posts)
        self.paging = try container.decode(Paging.self, forKey: .paging)

    }

}

struct Post: Codable {
    let updatedTime: String
    let id: String
    let message, story: String?
    
    enum CodingKeys: String, CodingKey {
        case updatedTime = "updated_time"
        case id, message, story
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.updatedTime = try container.decode(String.self, forKey: .updatedTime)
        self.id = try container.decode(String.self, forKey: .id)
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
        self.story = try container.decodeIfPresent(String.self, forKey: .story)
        
    }
}

struct Paging: Codable {
    let previous, next: String
    
    enum CodingKeys: String, CodingKey {
        case previous, next
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.previous = try container.decode(String.self, forKey: .previous)
        self.next = try container.decode(String.self, forKey: .next)
    }
}
