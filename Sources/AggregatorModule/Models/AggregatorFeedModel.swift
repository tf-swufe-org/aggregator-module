//
//  AggregatorFeedModel.swift
//  AggregatorModule
//
//  Created by Tibor Bodecs on 2020. 01. 26..
//

import Fluent
import FeatherCore

final class AggregatorFeedModel: FeatherModel {
    typealias Module = AggregatorModule

    static let modelKey: String = "feeds"
    static let name: FeatherModelName = "Feed"

    struct FieldKeys {
        static var imageKey: FieldKey { "image_key" }
        static var title: FieldKey { "title" }
        static var url: FieldKey { "url" }
    }
    
    // MARK: - fields

    @ID() var id: UUID?
    @Field(key: FieldKeys.imageKey) var imageKey: String
    @Field(key: FieldKeys.title) var title: String
    @Field(key: FieldKeys.url) var url: String
    @Children(for: \.$feed) var items: [AggregatorFeedItemModel]
    
    init() { }

    init(id: UUID? = nil,
         imageKey: String,
         title: String,
         url: String)
    {
        self.id = id
        self.imageKey = imageKey
        self.title = title 
        self.url = url
    }
    
    // MARK: - query

    static func allowedOrders() -> [FieldKey] {
        [
            FieldKeys.title,
            FieldKeys.url,
        ]
    }
    
    static func search(_ term: String) -> [ModelValueFilter<AggregatorFeedModel>] {
        [
            \.$title ~~ term,
            \.$url ~~ term,
        ]
    }
}
