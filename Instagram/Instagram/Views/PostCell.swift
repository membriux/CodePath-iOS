//
//  PostCell.swift
//  Instagram
//
//  Created by Memo on 12/10/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var captionUsernameLabel: UILabel!
    
    
    var post: Post! {
        didSet {
            setImage()
            setPost()
            
        }
    }
    
    
    func setImage() {
        // Set image of post
        if let imageFile = post.media {
            imageFile.getDataInBackground { (data, error) in
                if (data != nil) {
                    self.postImage.image = UIImage(data: data!)
                }
            }
        }
    }
    
    
    func setPost() {
        // Set the username, date, and caption of post
        if let username = post.author.username {
            // Set the user label
            userLabel.text = username
            
            // Check if there is a caption
            if !post.caption.isEmpty {
                captionUsernameLabel.text = username
                captionLabel.text = post.caption
            }
            
            // Set the date label of the post
            if let date = post.createdAt  {
                dateLabel.text = DateHelper.convertDate(date: date)
            }
            
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
