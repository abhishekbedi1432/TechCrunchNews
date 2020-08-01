//
//  EnvironmentConstants.swift
//  TechCrunchNews
//
//  Created by macintosh on 25/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import Foundation

enum Environment {
    case uat, prod
}
//-------------⌵⌵⌵⌵⌵⌵⌵⌵⌵⌵⌵⌵⌵⌵------------👇🏻👇🏻👇🏻👇🏻👇🏻👇🏻👇🏻👇🏻-----------------⌵⌵⌵⌵⌵⌵⌵-----------
let ENV:Environment = .prod
//-------------⌵⌵⌵⌵⌵⌵⌵⌵⌵⌵⌵⌵⌵⌵----------------------------------------------⌵⌵⌵⌵⌵⌵⌵-----------


extension Environment {
    
    var baseUrl:URL {
        
        switch self {
        case .prod:     return URL(staticString: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8ea484bff03d422c9f59620c9f57f8fd")
        case .uat:      return URL(staticString: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8ea484bff03d422c9f59620c9f57f8fd")
        }
    }
}
