//
//  GalleryImageTableViewCell.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 14/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit
import Kingfisher

class GalleryImageTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var galleryImageView: UIImageView!
    @IBOutlet weak var imageCountLabel: UILabel!
    @IBOutlet weak var imageCountHolderView: ShadowView!
    
    // Declarations
    var data: Gallery? {
        didSet {
            // Set title label
            titleLabel.text = data?.title
            
            // Set date label
            let unixTimestamp = Double((data?.datetime)!)
            dateLabel.text = unixTimestamp.dateTimeStringValue()
            
            // Set image count label
            let imageCount = data?.images?.count ?? 0
            if imageCount > 1 {
                imageCountHolderView.isHidden = false
                let displayImgCount = imageCount - 1
                if displayImgCount == 1 {
                    imageCountLabel.text = "\(displayImgCount) more image"
                    
                } else {
                    imageCountLabel.text = "\(displayImgCount) more images"
                    
                }
                
            } else {
                imageCountHolderView.isHidden = true
                
            }
            
            // Set image
            if (data?.images?[0].type) != nil {
                    let imageURL = URL(string: (data?.images?[0].link)!)
                    galleryImageView?.loadImageFrom(imageURL!)
                
            }
            
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Setup accessibilityIdentifier for cell image view for UI testing
        galleryImageView.accessibilityIdentifier = ImgurAccessibilityIdentifier.tableViewCellIamge
        
    }
    
}
