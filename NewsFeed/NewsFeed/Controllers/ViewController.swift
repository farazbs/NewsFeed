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
import SDWebImage

class ViewController: UIViewController {
    
    // Tableview to display news feeds
    @IBOutlet weak var tableviewNewsFeed : UITableView!
    var newsFeed : NewsFeed!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set Title of the screen
        self.title = "News"
        
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
                self.tableviewNewsFeed.reloadData()
            }
        }
    }
    
}
extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 82
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.newsFeed == nil || self.newsFeed.articles == nil{
            return 0
        }else{
            return (self.newsFeed.articles?.count)!
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellNewsFeed = tableviewNewsFeed.dequeueReusableCell(withIdentifier: "CellNewsFeed") as! CellNewsFeed
        let article = self.newsFeed.articles![indexPath.row]
        cellNewsFeed.lblPublishedAt.text = article.publishedAt
        cellNewsFeed.lblTitle.text = article.title
        cellNewsFeed.lblAuthor.text = article.author
        // SD image load data once only and it cache till the application life cycle
        cellNewsFeed.imgview.sd_setImage(with: URL(string: article.urlToImage!), placeholderImage: UIImage(named: "img_placeholder"), options: [], completed: nil)
        return cellNewsFeed
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feedsDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "FeedsDetailViewController") as! FeedsDetailViewController
        feedsDetailVC.article = self.newsFeed.articles![indexPath.row]
        self.navigationController?.pushViewController(feedsDetailVC, animated: true)
    }
}

