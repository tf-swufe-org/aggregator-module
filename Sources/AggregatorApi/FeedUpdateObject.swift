//
//  File.swift
//  
//
//  Created by Tibor Bodecs on 2021. 04. 28..
//

import Foundation

public struct FeedUpdateObject: Codable {

    public var imageKey: String
    public var title: String
    public var url: String
    
    
    public init(imageKey: String,
                title: String,
                url: String)
    {
        self.imageKey = imageKey
        self.title = title
        self.url = url
    }

}
