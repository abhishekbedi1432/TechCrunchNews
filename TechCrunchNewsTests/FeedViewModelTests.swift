//
//  FeedViewModelTests.swift
//  TechCrunchNewsTests
//
//  Created by macintosh on 26/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import XCTest
import SwiftyJSON

@testable import TechCrunchNews

class FeedViewModelTests: XCTestCase {

    func testIfFeedModelIsProperlyInstantiated() {
        
        let jsonString = """
{
      "source": {
        "id": "techcrunch",
        "name": "TechCrunch"
      },
      "author": "Jon Evans",
      "title": "Glimpses of China's parallel tech universe",
      "description": "Some description",
      "url": "https://techcrunch.com/2018/11/25/glimpses-of-chinas-parallel-tech-universe/",
      "urlToImage": "https://techcrunch.com/wp-content/uploads/2018/11/error-451.png?w=764",
      "publishedAt": "2018-11-25T14:00:19Z",
      "content": "A let of content"
    }
"""
        let jsonObj = JSON.init(parseJSON: jsonString)
        let feed = Feed.init(json: jsonObj)!
        let feedViewModel = FeedViewModel.init(feed: feed)
        XCTAssertNotNil(feedViewModel)
        XCTAssertEqual(feedViewModel?.author, "Jon Evans")
        
    }

    func testIfFeedModelIsNotProperlyInstantiated() {
        // Author is changed to number
        let jsonString = """
{
      "source": {
        "id": "techcrunch",
        "name": "TechCrunch"
      },
      "author": 123,
      "title": "Glimpses of China's parallel tech universe",
      "description": "Some description",
      "url": "https://techcrunch.com/2018/11/25/glimpses-of-chinas-parallel-tech-universe/",
      "urlToImage": "https://techcrunch.com/wp-content/uploads/2018/11/error-451.png?w=764",
      "publishedAt": "2018-11-25T14:00:19Z",
      "content": "A let of content"
    }
"""
        let jsonObj = JSON.init(parseJSON: jsonString)
        let feed = Feed.init(json: jsonObj)
        XCTAssertNil(feed)
    }
    
    
    func testIfFeedModelIsProperlyInstantiatedFromJSONLIST() {
        let responseString = TestUtility.loadResponse(fromPlist: "MockTCResponse", responseNode: "ValidResponse")
        let jsonObject     = JSON.init(parseJSON: responseString!)
        let feedList = Feed.list(fromJson: jsonObject)        
        XCTAssertEqual(feedList.count, 10)

    }

    
}
