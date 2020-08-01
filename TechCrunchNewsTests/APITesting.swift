//
//  APITesting.swift
//  TechCrunchNewsTests
//
//  Created by macintosh on 26/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import XCTest
@testable import TechCrunchNews
import SwiftyJSON

class APITesting: XCTestCase {

    class MockNetworkRequestHandler : NetworkRequestHandler {
        
        var plistName:String = ""
        var responseNode:String = ""
        private var responseString: String? = nil
        
        func getFeed(withURL url: URL, completionHandler: @escaping NetworkCompletionHandler) {
            let data = responseString?.data(using: .utf8)
            let json = try! JSON(data: data!)
            completionHandler(NetworkResult.success(json))
        }
        
        init(withPlistName plistName:String, responseNode:String) {
            self.plistName = plistName
            self.responseNode = responseNode
            responseString = TestUtility.loadResponse(fromPlist: plistName, responseNode: responseNode)
        }
    }
    
    
    
    func testValidResponseLoading() {
        let router = MockNetworkRequestHandler(withPlistName: "MockTCResponse", responseNode: "ValidResponse")
        let apiHandler = APIHandler(router: router)
        let payload = APIPayload(url: URL(string: "www.google.com")!)
        
        apiHandler.getFlickerFeed(withPayload: payload) { (networkResult) in
            
            switch networkResult {
            case .failure(let error):
                XCTFail((error?.localizedDescription)!)
            case .success(let json):
                XCTAssert(json["articles"].arrayValue.count == 10, "Incorrect resultCount")
            }
            
        }
        
    }
}
