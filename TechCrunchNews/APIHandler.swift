//
//  APIHandler.swift
//  TechCrunchNews
//
//  Created by macintosh on 25/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import Foundation

typealias NetworkCompletionHandler = (NetworkResult) -> Void

struct APIPayload {
    let url:URL
}

/// `APIHandler` is
struct APIHandler {

    let router: NetworkRequestHandler
    
    init(router: NetworkRequestHandler = URLSession.shared) {
        self.router = router
    }

    func getFlickerFeed(withPayload payload:APIPayload, andCompletionHandler handler: @escaping NetworkCompletionHandler) {
        let url = payload.url
        router.getFeed(withURL: url, completionHandler: handler)
    }
}
