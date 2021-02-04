//
//  PostDetailViewController.swift
//  Instagram
//
//  Created by Memo on 2/13/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit

class PostDetailViewController: UIViewController {

    
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionUsernameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    
    var post: Post!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupItems()
    }
    
    
    func setupItems() {
        // Set image of post
        if let imageFile = post.media {
            imageFile.getDataInBackground { (data, error) in
                if (data != nil) {
                    self.postImage.image = UIImage(data: data!)
                }
            }
        }
        
        // Set the username, date, and caption of post
        if let username = post.author.username {
            // Set the user label
            usernameLabel.text = username
            
            // Check if there is a caption
            if !post.caption.isEmpty {
                captionUsernameLabel.text = username
                captionLabel.text = post.caption
            } else {
                captionUsernameLabel.text = ""
                captionLabel.text = ""
            }
            
            // Set the date label of the post
            if let date = post.createdAt  {
                dateLabel.text = DateHelper.convertDate(date: date)
            }
            
        }
        
    }
    

}
