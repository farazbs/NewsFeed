//
//  FeedsDetailViewController.swift
//  NewsFeed
//
//  Created by admin on 11/23/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class FeedsDetailViewController: UIViewController {
    var article : Article!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblPublishedAt : UILabel!
    @IBOutlet weak var textviewDesc : UITextView!
    @IBOutlet weak var imgview : UIImageView!
    @IBOutlet weak var lblAuthor : UILabel!
    @IBOutlet weak var textviewContent : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Title of the screen
        self.title = "News Detail"
        
        // Populate values in detail screen fields
        self.lblTitle.text = article.title
        self.lblPublishedAt.text = article.publishedAt
        self.textviewDesc.text = article.description
        self.imgview.sd_setImage(with: URL(string: article.urlToImage!), placeholderImage: UIImage(named: "img_placeholder"), options: [], completed: nil)
        self.lblAuthor.text = article.author
        self.textviewContent.text = article.content
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.textviewDesc.setContentOffset(.zero, animated: false)
        self.textviewContent.setContentOffset(.zero, animated: false)
    }
}
