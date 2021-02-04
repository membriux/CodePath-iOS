//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Memo on 12/18/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userHandleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favoritedButton: UIButton!
    
    
    var tweet: Tweet! {
        didSet {
            if tweet.user?.profileImage! != nil {
                // Set rounded profile picture
                profileImage.af_setImage(withURL: tweet.user!.profileImage!)
                profileImage.layer.cornerRadius = profileImage.frame.height/2
                profileImage.clipsToBounds = true
            }
            if tweet.favorited == true {   
                favoritedButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
            }
            nameLabel.text = tweet.user?.name
            userHandleLabel.text = tweet.user?.screenName
            dateLabel.text = tweet.createdAtString
            tweetLabel.text = tweet.text
            retweetCountLabel.text = String(describing: tweet.retweetCount!)
            favoriteCountLabel.text = String(describing: tweet.favoriteCount!)
            
        }
    }
    
    
    func refreshData() {
        if tweet.favorited! == true {
            favoritedButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            favoritedButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
        if tweet.retweeted! == true {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
        } else {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
        }
        
        retweetCountLabel.text = String(describing: tweet.retweetCount!)
        favoriteCountLabel.text = String(describing: tweet.favoriteCount!)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    @IBAction func onReply(_ sender: Any) {
    }
    
    
    @IBAction func onRetweet(_ sender: Any) {
        if tweet.retweeted == false {
            tweet.retweeted = true
            tweet.retweetCount! += 1
            refreshData()
            APIManager.shared.retweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let error = error {
                    print("\nError retweeting: \(error.localizedDescription)\n ")
                } else if let tweet = tweet {
                    print("\nSuccessfuly retweeted: \(tweet.text!)")
                }
            }
        } else {
            tweet.retweeted = false
            tweet.retweetCount! -= 1
            refreshData()
            APIManager.shared.unretweet(tweet) { (tweet: Tweet?, error: Error?) in
                if let error = error {
                    print("\nError UNretweeting: \(error.localizedDescription)\n ")
                } else if let tweet = tweet {
                    print("\nSuccessfuly UNretweeted: \(tweet.text!)")
                }
            }
        }
        
        
    }
    
    
    @IBAction func onFavorite(_ sender: Any) {
        if tweet.favorited == false {
            tweet.favorited = true
            tweet.favoriteCount! += 1
            refreshData()
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("\nError favoriting tweet: \(error.localizedDescription)\n")
                } else if let tweet = tweet {
                    print("\nSuccessfully FAVORITED the following Tweet: \n\(tweet.text!)\n")
                }
            }
            
            
        } else {
            tweet.favorited = false
            tweet.favoriteCount! -= 1
            refreshData()
            APIManager.shared.favorite(tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("\nError unfavoriting tweet: \(error.localizedDescription)\n")
                } else if let tweet = tweet {
                    print("\nSuccessfully UNFAVORITED the following Tweet: \n\(tweet.text!)\n")
                }
            }
        }
        
    }
    
    
    
    
    @IBAction func onMessage(_ sender: Any) {
    }
    

    
}
