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
    var imageUrlString:String? {get set}
    var content:String? {get set}
}

struct FeedViewModel: FeedDisplayable {
    var author: String?
    var title: String?
    var description: String?
    var imageUrlString: String?
    var content: String?
    
    init?(feed:Feed) {
        author         = feed.author
        title          = feed.title
        description    = feed.author
        imageUrlString = feed.urlToImage
        content        = feed.content
    }
}



class FeedCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var title: UILabel!

    
    func configure(withModel model:FeedDisplayable) {
        title.text    = model.title
        subTitle.text = model.description
        img.kf.setImage(with: URL.init(string: model.imageUrlString ?? ""),
                        placeholder: UIImage.init(named: K.ImageName.default))
    }
}
