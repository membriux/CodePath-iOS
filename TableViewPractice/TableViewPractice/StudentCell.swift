//
//  StudentCell.swift
//  TableViewPractice
//
//  Created by Memo on 1/7/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    
    
    @IBOutlet weak var studentNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
