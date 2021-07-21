//
//  FeedDetailVC.swift
//  TechCrunchNews
//
//  Created by macintosh on 26/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import UIKit
import Kingfisher

class FeedDetailVC: UITableViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    private var imageUrlString = ""
    
    // Using Reflection in Swift to get all the elements of the FeedViewModel as an array of keys and Values
    var feedViewModel:FeedViewModel! {
        didSet {
            let mirror = Mirror(reflecting: feedViewModel as! FeedViewModel)
            
            for child in mirror.children  {
                print("key: \(String(describing: child.label)), value: \(child.value)")
                if let key = child.label, let value = child.value as? String {
                    
                    // Extracting the Image Url from the Model
                    if key == "imageUrlString" {
                        imageUrlString = value
                    }
                    
                    let vm = FeedDetailViewModel(title: key, subtitle: value)
                    viewModels.append(vm)
                }
                
            }
        }
    }
    
    // The Datasource for the table
    private var viewModels: [FeedDetailViewModel] = []
    
    // MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupArticleImage()
    }
    deinit {
        print("Deinit called FeedDetailView")
    }

    // MARK: - Article Image Setup

    private func setupArticleImage() {
        imageView.kf.setImage(with: URL(string: imageUrlString ),
                              placeholder: UIImage(named: K.ImageName.default))
    }
    
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedDetailCell", for: indexPath) as? FeedDetailCell else {
            assertionFailure("FeedDetailCell Should be initialized")
            return UITableViewCell()
        }
        
        let vm = viewModels[indexPath.row];
        cell.configure(withFeedDetailViewModel: vm)
        return cell;
        
    }
    
}
