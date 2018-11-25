//
//  FeedDisplayable.swift
//  TechCrunchNews
//
//  Created by macintosh on 26/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import Foundation

protocol FeedDisplayable {
    var author:String? {get set}
    var title:String? {get set}
    var description:String? {get set}
    var imageUrlString:String? {get set}
    var content:String? {get set}
}
