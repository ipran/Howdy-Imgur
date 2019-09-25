//
//  HomeViewControllerExtension.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 25/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit
import Foundation


// MARK: - Textfield Delegate
extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Move segment control on All
        toggleSegmentControl.selectedSegmentIndex = 0
        // Scroll tableview to top
        tableView.setContentOffset(.zero, animated: true)
        // Hide no response lable once user click on the search button
        self.noResponseLabel.isHidden = true
        
        // Handle control to presenter on text field return
        activityIndicatorView.startAnimating()
        presenter?.fetchImageList(with: textField.text!)
        
        textField.resignFirstResponder()
        return true
        
    }
    
}

// MARK: - Utility Functions
extension HomeViewController {
    func initialSetup() {
        // Seup SearchField
        searchField.returnKeyType = .search
        // Setup Segment Control
        toggleSegmentControl.setImage(getImageWithColor(color: #colorLiteral(red: 0.9700000286, green: 0.7099999785, blue: 0.1800000072, alpha: 1), size: CGSize(width: 80, height: 40)), forSegmentAt: 0)
        toggleSegmentControl.setImage(getImageWithColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , size: CGSize(width: 80, height: 40)), forSegmentAt: 1)
        toggleSegmentControl.addTarget(self, action: #selector(didTapSegmentControl), for: .valueChanged)
        hideSegmentControl()
        
    }
    func updateUIControls() {
        if let cellCount = gallery?.count {
            if cellCount == 0 {
                noResponseLabel.isHidden = false
                noResponseLabel.text = ImgurMessages.noResultForSearch
                appInfoLabel.text = ImgurMessages.appInfo
                hideSegmentControl()
                
            }
            else {
                noResponseLabel.isHidden = true
                appInfoLabel.text = ImgurMessages.appInfoWhenToggleOn
                showSegmentControl()
                
            }
            
        }
        
    }
    func showSegmentControl() {
        segmentControlViewHeightConstraint.constant = 56
        
    }
    func hideSegmentControl() {
        segmentControlViewHeightConstraint.constant = 0
    }
    @objc func didTapSegmentControl(segmentControl: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
            
        case 0:
            presenter?.fetchImageList(with: searchField.text!)
            break
            
        case 1:
            if gallery != nil {
                presenter?.sortGalleryListForLessResult(with: gallery!)
                
            }
            break
            
        default:
            break
            
        }
        
    }
    func refreshTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
        
    }
    
}
