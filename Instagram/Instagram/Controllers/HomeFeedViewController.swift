//
//  HomeFeedViewController.swift
//  Instagram
//
//  Created by Memo on 11/24/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

/*----- Comment -----*/


class HomeFeedViewController: UIViewController {

    
    @IBOutlet weak var postsTableView: UITableView!
    
    var posts: [Post] = []
    let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postsTableView.dataSource = self
        postsTableView.delegate = self
        postsTableView.rowHeight = UITableView.automaticDimension
        postsTableView.estimatedRowHeight = 100
        
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControl.Event.valueChanged)
        postsTableView.insertSubview(refreshControl, at: 0)

        getPosts()

    }
    
    
    /*----- Network Request Methods -----*/
    
    func getPosts() {
        Posts.getPosts() { (posts) in
            guard let posts = posts else {
                return
            }
            self.posts = posts
            self.postsTableView.reloadData()
        }
    }
    
    // Refresh posts
    @objc func refreshControlAction(_ refreshControl: UIRefreshControl) {
        Posts.getPosts() { (posts) in
            guard let posts = posts else {
                return
            }
            self.posts = posts
            self.postsTableView.reloadData()
            refreshControl.endRefreshing()
        }
        
        
    }
    
    /*----- Show post details -----*/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        if let indexPath = postsTableView.indexPath(for: cell) {
            let post = posts[indexPath.row]
            let PostsDetailsVC = segue.destination as! PostDetailViewController
            PostsDetailsVC.post = post
            
        }
    }
    
    
    /*----- Logout -----*/
    @IBAction func onLogout(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    }
    
}


extension HomeFeedViewController: UITableViewDelegate, UITableViewDataSource {
    
    /*----- TableView Configurations -----*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Set the cell attributes to be ready to put information
        let cell = postsTableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.captionUsernameLabel.text = ""
        cell.captionLabel.text = ""
        
        let post = posts[indexPath.row]
        
        cell.post = post
        
        return cell
    
    }
}
