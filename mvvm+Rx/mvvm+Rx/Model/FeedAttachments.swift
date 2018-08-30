//
//  FeedAttachments.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 29/08/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let feedAttachments = try? newJSONDecoder().decode(FeedAttachments.self, from: jsonData)

import Foundation

struct FeedAttachments: Codable {
    let data: [FeedAttachmentsData]
    let paging: Paging
    
    enum CodingKeys: String, CodingKey {
        case data, paging
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([FeedAttachmentsData].self, forKey: .data)
        self.paging = try container.decode(Paging.self, forKey: .paging)
    }
}

struct FeedAttachmentsData: Codable {
    let id: String
    let attachments: Attachments?
    
    enum CodingKeys: String, CodingKey {
        case id, attachments
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.attachments = try container.decodeIfPresent(Attachments.self, forKey: .attachments)
    }
}

struct Attachments: Codable {
    let data: [AttachmentData]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([AttachmentData].self, forKey: .data)
    }
}

struct AttachmentData: Codable {
    let media: Media?
    let target: Target
    let type, url: String
    let description, title: String?
    let subattachments: Subattachments?
    
    enum CodingKeys: String, CodingKey {
        case media,target,
        type,url,
        description,title,
        subattachments
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
       
        self.media = try container.decodeIfPresent(Media.self, forKey: .media)
        self.target = try container.decode(Target.self, forKey: .target)
        self.type = try container.decode(String.self, forKey: .type)
        self.url = try container.decode(String.self, forKey: .url)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.subattachments = try container.decodeIfPresent(Subattachments.self, forKey: .subattachments)
    }
    
}

struct Media: Codable {
    let image: Image
    
    enum CodingKeys: String, CodingKey {
        case image
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.image = try container.decode(Image.self, forKey: .image)
    }
}

struct Image: Codable {
    let height: Int
    let src: String
    let width: Int
    
    enum CodingKeys: String, CodingKey {
        case height, width, src
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.height = try container.decode(Int.self, forKey: .height)
        self.width = try container.decode(Int.self, forKey: .width)
        self.src = try container.decode(String.self, forKey: .src)
    }
}

struct Subattachments: Codable {
    let data: [Subattachment]
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode([Subattachment].self, forKey: .data)
    }
}

struct Subattachment: Codable {
    let media: Media?
    let target: Target
    let type: String
    let url, title: String?
    
    enum CodingKeys: String, CodingKey {
        case media,target,
        type,title,url
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.media = try container.decodeIfPresent(Media.self, forKey: .media)
        self.target = try container.decode(Target.self, forKey: .target)
        self.type = try container.decode(String.self, forKey: .type)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
    }
}

struct Target: Codable {
    let id, url: String?
    
    enum CodingKeys: String, CodingKey {
        case id, url
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}
