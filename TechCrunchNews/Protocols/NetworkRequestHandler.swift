//
//  NetworkRequestHandler.swift
//  TechCrunchNews
//
//  Created by macintosh on 26/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import Foundation
protocol NetworkRequestHandler {
    func getFeed(withURL url: URL, completionHandler:@escaping NetworkCompletionHandler)
}
