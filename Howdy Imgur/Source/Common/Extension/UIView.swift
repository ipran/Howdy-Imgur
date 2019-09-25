//
//  UIView.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 14/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit

extension UIView {
    // Corner Radius
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
            
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
            
        }
        
    }
    
}
