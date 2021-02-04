//
//  User.swift
//  twitter_alamofire_demo
//
//  Created by Aristotle on 2018-10-05.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class User: NSObject {
    
    static var current: User?
    
    
    var name: String?
    var screenName: String?
    var profileImage: URL?
    
    init(dictionary: [String : Any]) {
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        profileImage = URL(string: dictionary["profile_image_url"] as? String ?? "") 
        super.init()
    }
}
