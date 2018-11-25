//
//  TestUtility.swift
//  TechCrunchNewsTests
//
//  Created by macintosh on 26/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import Foundation
struct TestUtility {
    static func loadResponse(fromPlist plist:String, responseNode:String) -> String? {
        guard
            let fileURL = Bundle(for: TechCrunchNewsTests.classForCoder()).url(forResource: plist, withExtension: "plist"),
            let data = try? Data(contentsOf: fileURL),
            let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil),
            let json = result as? [String:String]
            
            else {
                assertionFailure("Plist/Response Node not configured properly")
                return nil
        }
        return json[responseNode]
    }
    
}
