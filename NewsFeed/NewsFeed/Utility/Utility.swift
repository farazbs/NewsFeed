//
//  Utility.swift
//  NewsFeed
//
//  Created by admin on 11/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

class Utility : NSObject{
    
    // Copied following method from Google and modified it according to requirement
    static func formatDate(date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        //    dateFormatter.locale = Locale(identifier: "en_US") //umcomment if you don't want to get the sistem default format.
        
        let dateObj: Date? = dateFormatterGet.date(from: date)
        
        return dateFormatter.string(from: dateObj!)
    }
}
