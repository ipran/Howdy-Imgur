//
//  Utils.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 25/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit
import Foundation

// Support Segment Control
func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(rect)
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return image
    
}
