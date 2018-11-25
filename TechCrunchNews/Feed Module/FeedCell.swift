//
//  FeedCell.swift
//  TechCrunchNews
//
//  Created by macintosh on 25/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//


import UIKit
import SwiftyJSON
import Kingfisher

protocol FeedDisplayable {
    var author:String? {get set}
    var title:String? {get set}
    var description:String? {get set}
    var imageUrl:URL? {get set}
    var content:String? {get set}
}

struct FeedViewModel: FeedDisplayable {
    var author: String?
    var title: String?
    var description: String?
    var imageUrl: URL?
    var content: String?
    
    init?(feed:Feed) {
        author = feed.author
        title = feed.title
        description = feed.author
        imageUrl = URL.init(string: feed.urlToImage ?? "")
        content = feed.content
    }
}



class FeedCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!

    
    func configure(withModel model:FeedDisplayable) {
        title.text    = model.title
        subTitle.text = model.description
        img.kf.setImage(with: model.imageUrl)
        img.kf.placeholder = UIImage.init(named: K.Image.placeholder) 
    }
}
