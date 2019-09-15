//
//  UIImageView.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 15/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    //Load images from URL
    func loadImageFrom(_ url: URL) {
        let processor = DownsamplingImageProcessor(size: (self.bounds.size))
            >> RoundCornerImageProcessor(cornerRadius: 6)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholder"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                if logActivity {
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                    
                }
            case .failure(let error):
                if logActivity {
                    print("Job failed: \(error.localizedDescription)")
                    
                }
                
            }
            
        }
        
    }
    
}
