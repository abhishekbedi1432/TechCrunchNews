//
//  FeedTableViewController.swift
//  TechCrunchNews
//
//  Created by macintosh on 25/11/18.
//  Copyright © 2018 macintosh. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    var feedViewModels:[FeedViewModel] = [] {
        didSet {
            refreshTableView(withFeedViewModels: feedViewModels)
        }
    }
    
    lazy var apiHandler:APIHandler = APIHandler()
    
    deinit {
        print("Deinit called")
    }

    @IBAction func refreshButtonAction(_ sender: Any) {
        loadFeed()
    }

    private func refreshTableView(withFeedViewModels models:[FeedViewModel]) {
        
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        tableView.reloadSections(sections as IndexSet, with: .automatic)
    }
    
    
    @objc private func loadFeed() {
        
        //let snackbar = showMessage(error: "Loading ...", duration: .forever)
        
        guard let url = URL.init(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8ea484bff03d422c9f59620c9f57f8fd") else {
            assertionFailure("Malformed URL")
            return
        }
        
        let payload = APIPayload(url: url)
        apiHandler.getFlickerFeed(withPayload: payload) { [weak self] networkResult in
            
            guard let strongSelf = self else {
                assertionFailure("Self deallocated")
                return
            }
            
            //snackbar.dismiss()
            
            switch networkResult {
            case .failure(let error):
                DispatchQueue.main.async {
                    //strongSelf.showMessage(error: error?.localizedDescription ?? "X")
                }
            case .success(let json):
                let feeds = Feed.list(fromJson: json)
                var feedVMs: [FeedViewModel] = []
                for feed in feeds {
                    if let feedVM = FeedViewModel.init(feed: feed) {
                        feedVMs.append(feedVM)
                    }
                }
                strongSelf.feedViewModels = feedVMs
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(loadFeed))
        
        loadFeed()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedViewModels.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as? FeedCell else {
            assertionFailure("Feed Cell Should be initialized")
            return UITableViewCell()
        }
        
        let vm = feedViewModels[indexPath.row]
        cell.configure(withModel: vm)
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        
    }

}
