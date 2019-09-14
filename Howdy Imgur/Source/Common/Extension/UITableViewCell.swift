//
//  UITableViewCell.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 14/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit

extension UITableViewCell {
    // Fetch TableViewCell identifier name
    static var identifier: String {
        return String(describing: self).components(separatedBy: ".").last!
        
    }
    
}
