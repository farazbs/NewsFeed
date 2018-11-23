//
//  Article.swift
//  NewsFeed
//
//  Created by admin on 11/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import ObjectMapper

class Article : Mappable{
    
    required init?(map: Map) {        
        author = (try? map.value("author")) ?? ""
        title = (try? map.value("title")) ?? ""
        description = (try? map.value("description")) ?? ""
        url = (try? map.value("url")) ?? ""
        urlToImage = (try? map.value("urlToImage")) ?? ""
        publishedAt = (try? map.value("publishedAt")) ?? ""
        content = (try? map.value("content")) ?? ""
    }
    
    var author : String?
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : String?
    var publishedAt : String?
    var content : String?
    
    func mapping(map: Map) {
        
        author  >>> map["author"]
        title  >>> map["title"]
        description  >>> map["description"]
        url  >>> map["url"]
        urlToImage  >>> map["urlToImage"]
        publishedAt  >>> map["publishedAt"]
        content  >>> map["content"]
    }
}
