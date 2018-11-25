//
//  NetworkHandler.swift
//  TechCrunchNews
//
//  Created by macintosh on 25/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import Foundation
import SwiftyJSON

enum NetworkResult {
    case success(JSON)
    case failure(Error?)
}

protocol NetworkRequestHandler {
    func getFeed(withURL url: URL, completionHandler:@escaping NetworkCompletionHandler)
}

extension URLSession : NetworkRequestHandler {
    
    func getFeed(withURL url: URL, completionHandler:@escaping NetworkCompletionHandler) {
        
        print("Hit Network Req: \(url.absoluteString)")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard data != nil else {
                DispatchQueue.main.async {
                    completionHandler(NetworkResult.failure(error))
                }
                return
            }
            do {
                let json = try JSON(data: data!)
                
                DispatchQueue.main.async {
                    completionHandler(NetworkResult.success(json))
                }
            }
            catch(let error) {
                DispatchQueue.main.async {
                    completionHandler(NetworkResult.failure(error))
                }
            }
        }
        task.resume()
    }
}
