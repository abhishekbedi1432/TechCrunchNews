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
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    private var imageUrlString = ""
    var feedViewModel:FeedViewModel! {
        didSet {
            let mirror = Mirror(reflecting: feedViewModel as! FeedViewModel)
            
            for child in mirror.children  {
                print("key: \(String(describing: child.label)), value: \(child.value)")
                if let key = child.label, let value = child.value as? String {
                    
                    if key == "imageUrlString" {
                        imageUrlString = value
                    }
                    
                    let vm = FeedDetailViewModel.init(title: key, subtitle: value)
                    viewModels.append(vm)
                }
                
            }
        }
    }
    
    private var viewModels: [FeedDetailViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(imageUrlString)
        imageView.kf.setImage(with: URL.init(string: imageUrlString ),
                        placeholder: UIImage.init(named: K.ImageName.default))
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
