//
//  TimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Aristotle on 2018-08-11.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    
    
    @IBOutlet weak var tweetsTableView: UITableView!
    
    var tweets: [Tweet] = []
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetsTableView.dataSource = self
        tweetsTableView.delegate = self
        
        tweetsTableView.rowHeight = UITableView.automaticDimension
        tweetsTableView.estimatedRowHeight = 50

        
        setupRefreshControl()
        fetchTweets()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fetchTweets() {
        APIManager.shared.getHomeTimeLine { (tweets, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                self.tweets = tweets!
                print(self.tweets)
                self.tweetsTableView.reloadData()
            }
        }
    }
    
    
    @IBAction func onLogout(_ sender: Any) {
        APIManager.shared.logout()
    }
    
    
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControl.Event.valueChanged)
        tweetsTableView.insertSubview(refreshControl, at: 0)
    }
    
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
        self.tweets = []
        self.tweetsTableView.reloadData()
        self.fetchTweets()
        self.refreshControl.endRefreshing()
        self.tweetsTableView.separatorStyle = .singleLine
    }
    
}



extension TimelineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tweetsTableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        let tweet = tweets[indexPath.row]
        cell.tweet = tweet
        
        return cell
    
    }
    
    
    
    
    
}
