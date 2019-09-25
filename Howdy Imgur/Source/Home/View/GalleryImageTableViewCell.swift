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
            configure(data)
            
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Setup accessibilityIdentifier for cells imageView for UI testing
        galleryImageView.accessibilityIdentifier = ImgurAccessibilityIdentifier.tableViewCellIamge
        
    }
    func configure(_ data: Gallery?) {
        titleLabel.text = data?.title
        
        let unixTimestamp = Double((data?.datetime)!)
        dateLabel.text = unixTimestamp.dateTimeStringValue()
        
        let imageCount = data?.images?.count ?? 0
        if imageCount > 1 {
            setImageCountLabel(imageCount)
            
        } else {
            imageCountHolderView.isHidden = true
            
        }
        
        // Set image
        if (data?.images?[0].type) != nil {
            let imageURL = URL(string: (data?.images?[0].link)!)
            galleryImageView?.loadImageFrom(imageURL!)
            
        }
        
    }
    func setImageCountLabel(_ imageCount: Int) {
        imageCountHolderView.isHidden = false
        let displayImgCount = imageCount - 1
        if displayImgCount == 1 {
            imageCountLabel.text = "\(displayImgCount) \(ImgurContants.cellImageCount)"
            
        } else {
            imageCountLabel.text = "\(displayImgCount) \(ImgurContants.cellImagesCount)"
            
        }
        
    }
    
}
