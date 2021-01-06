//
//  VideoResource.swift
//  
//
//  Created by Mats Mollestad on 05/01/2021.
//

import Foundation

public struct VideoResource: Equatable, Codable {
    public init(url: String, title: String, creator: String, duration: Int?) {
        self.url = url
        self.title = title
        self.creator = creator
        self.duration = duration
    }
    
    public let url: String
    public let title: String
    public let creator: String
    public let duration: Int?
}

extension VideoResource {
    public enum Create {
        public struct Data: Codable {
            
            public let title: String
            public let url: String
            public let creator: String

            /// The duration in number of seconds
            public let duration: Int?
            
            public init(title: String, url: String, creator: String, duration: Int?) {
                self.title = title
                self.url = url
                self.creator = creator
                self.duration = duration
            }
        }
    }
}
