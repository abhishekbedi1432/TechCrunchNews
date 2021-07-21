//
//  FeedTableViewController+Flutter.swift
//  TechCrunchNews
//
//  Created by kbedi on 21/07/2021.
//  Copyright © 2021 macintosh. All rights reserved.
//

import Foundation
import Flutter

enum ChannelName {
    static let iOS = "com.bedi.channel/iOS"
}

extension FeedTableViewController {
    
    func showFlutter() {
        present(flutterViewController, animated: true, completion: nil)
    }

    
    func setupFlutterChannel() {
        let channel = FlutterMethodChannel(name: ChannelName.iOS, binaryMessenger: flutterViewController.binaryMessenger)
        
        channel.setMethodCallHandler {[weak self]  call, result in
            if call.method == "FlutterWantsToCallNativeMethod" {
                if let args = call.arguments as? [String] {
                    print(args)
                    self?.callNativeCode()
                }
                result("Hi From Swift FeedTableviewController")
            }
        }
    }
    
    func callNativeCode() {
        flutterViewController.dismiss(animated: true, completion: nil)
    }
}
