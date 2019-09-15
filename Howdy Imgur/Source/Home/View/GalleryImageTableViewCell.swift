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
    // Declarations
    var data: Gallery? {
        didSet {
            // Set title label
            titleLabel.text = data?.title
            // Set date label
            let unixTimestamp = Double((data?.datetime)!)
            dateLabel.text = unixTimestamp.dateTimeStringValue()
            // Set image count label
            let imageCount = data?.images?.count ?? Int(truncating: 0 as NSNumber)
            if imageCount > 1 {
                imageCountLabel.text = "\(imageCount - 1) more"
                
            }
            // Set image
            if let imageType = data?.images?[0].type {
                if !(imageType == "video/mp4") {
                    let imageURL = URL(string: (data?.images?[0].link)!)
                    galleryImageView?.loadImageFrom(imageURL!)
                    
                }
                else {
                    galleryImageView.image = #imageLiteral(resourceName: "no_image")
                    
                }
                
            }
            
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
