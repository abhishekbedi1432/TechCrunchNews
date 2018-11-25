//
//  FeedViewModel.swift
//  TechCrunchNews
//
//  Created by macintosh on 26/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import Foundation

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

