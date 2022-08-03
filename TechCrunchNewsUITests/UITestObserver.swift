//
//  UITestObserver.swift
//  TechCrunchNewsUITests
//
//  Created by Abhishek Bedi on 01/08/2022.
//  Copyright © 2022 macintosh. All rights reserved.
//

import XCTest
import Foundation
import SBTUITestTunnelClient

class UITestObserver: NSObject, XCTestObservation {

    override init() {
        super.init()
        XCTestObservationCenter.shared.addTestObserver(self)
    }
    
//  Use this to setup the Stubbing Server!
    func testCaseWillStart(_ testCase: XCTestCase) {
        
        print("---## \(#function), URL: \(testCase.description)")
        
        testCase.app.launchTunnel(withOptions: [SBTUITunneledApplicationLaunchOptionResetFilesystem]) {
                    print("do additional setup before the app launches")
                    print("i.e. prepare stub request, start monitoring requests")
//        https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8ea484bff03d422c9f59620c9f57f8fd
            
            let request = SBTRequestMatch(url: "https://newsapi.org/v2/top-headlines/*")
            
            let bundle = Bundle(for: type(of: self))
            let path = bundle.path(forResource: "TechCrunchStub", ofType: "json")!
            
            let response =  SBTStubResponse(fileNamed: path)
            
            testCase.app.stubRequests(matching: request, response: response)
        }
    }
    
    func testCaseDidFinish(_ testCase: XCTestCase) {
        testCase.app.stubRequestsRemoveAll()
    }
}
