//
//  NewsFeed.swift
//  NewsFeed
//
//  Created by admin on 11/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import ObjectMapper

class NewsFeed: Mappable {
    required init?(map: Map) {
        
    }
    var status : String?
    var totalResult : Int?
    var articles : [Article]?
    func mapping(map: Map) {
        status <- map["status"]
        totalResult <- map["totalResult"]
        articles <- map["articles"]
    }
}
