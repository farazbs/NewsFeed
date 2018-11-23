//
//  ViewController.swift
//  NewsFeed
//
//  Created by admin on 11/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class ViewController: UIViewController {
    
    // Tableview to display news feeds
    @IBOutlet weak var tableviewNewsFeed : UITableView!
    var newsFeed : NewsFeed!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Registered on newsapi and got following URL with apikey
        let apiURL = "https://newsapi.org/v2/everything?q=bitcoin&from=2018-10-23&sortBy=publishedAt&apiKey=" + Constant.apiKey
        
        // Alamofire method to consume newsfeed api
        Alamofire.request(apiURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON{(response:DataResponse<Any>)in
            // Checking if getting data in response result
            if let result = response.result.value{
                
                // After getting data paring into JSON
                let JSONResponse = JSON(result)
                print(JSONResponse)
                
                // Feeding newsFeed model object with data
                self.newsFeed = Mapper<NewsFeed>().map(JSON: JSONResponse.dictionaryObject!)
            }
        }
    }


}

