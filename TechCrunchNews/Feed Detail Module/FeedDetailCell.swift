//
//  FeedDetailCell.swift
//  TechCrunchNews
//
//  Created by macintosh on 26/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import UIKit

class FeedDetailCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    func configure(withFeedDetailViewModel vm:FeedDetailViewModel) {
        titleLabel.text    = vm.title?.capitalized
        subtitleLabel.text = vm.subtitle
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        subtitleLabel.textColor = UIColor.gray
    }
}
