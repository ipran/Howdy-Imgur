//
//  Double.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 15/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

extension Double {
    // Convert UNIX Timestamp to String
    func dateTimeStringValue() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd-MM-yyyy h:mm a" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        return strDate
        
    }
    
}
