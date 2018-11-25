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
