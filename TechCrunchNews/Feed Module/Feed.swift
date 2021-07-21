//
//  Feed.swift
//  TechCrunchNews
//
//  Created by macintosh on 25/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Feed : Codable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var content:String?
    
    init?(json:JSON) {
        guard
            let data = try? json.rawData(),
            let feed = try? JSONDecoder().decode(Feed.self, from: data)
            else {
                return nil
        }
        self = feed
    }
}

extension Feed {
    static func list(fromJson json:JSON) -> [Feed] {
        let articles = json["articles"].arrayValue;
        return articles.compactMap({ (json) -> Feed? in
            if let feed = Feed(json: json) {
                return feed
            }
            return nil
        })
    }
}
