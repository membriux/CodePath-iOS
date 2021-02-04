//
//  DateHelper.swift
//  Instagram
//
//  Created by Memo on 12/10/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import Foundation



struct DateHelper {
    

    static func convertDate(date: Date) -> String {
        let format = "MMM d, h:mm a"
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let dateString = formatter.string(from: date)
        return dateString
    }
    
    
}
