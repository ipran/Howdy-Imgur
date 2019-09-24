//
//  HomeViewController.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var segmentControlContainer: ShadowView!
    @IBOutlet weak var toggleSegmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noResponseLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var segmentControlViewHeightConstraint: NSLayoutConstraint!
    // Delclarations
    var presenter: HomeViewPresenterProtocol?
    var gallery: [Gallery]?
    
    /**
     Instantiate a controller
     */
    static func instantiateViewController() -> HomeViewController {
        return UIStoryboard.home().instantiateViewController(withIdentifier: HomeViewController.identifier) as! HomeViewController
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HomeViewRouter.createHomeViewModule(homeViewRef: self)
        initialSetup()
        presenter?.viewDidLoad()
        
    }
    
}

// MARK: - Presenter Protocols
extension HomeViewController: HomeViewProtocol {
    func showImageList(with gallery: [Gallery]) {
        showSegmentControl()
        self.gallery = gallery
        self.activityIndicatorView.stopAnimating()
        updateUIControls()
        refreshTableView()
        
    }
    func showAPIError(message: String) {
        self.gallery = nil
        self.noResponseLabel.isHidden = false
        self.noResponseLabel.text = message
        self.activityIndicatorView.stopAnimating()
        refreshTableView()
        
    }
    func showFilteredImageList(with gallery: [Gallery]) {
        self.gallery = gallery
        self.activityIndicatorView.stopAnimating()
        updateUIControls()
        showSegmentControl()
        refreshTableView()
        
    }
    
}

// MARK: - Tableview Delegate & Datasource
extension HomeViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gallery?.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GalleryImageTableViewCell.identifier) as! GalleryImageTableViewCell
        guard let data = gallery?[indexPath.row] else {
            return cell
        }
        cell.selectionStyle = .none
        cell.data = data
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
        
    }
    
}

// MARK: - Utility Functions
extension HomeViewController {
    /**
     Doing the initial setup for the controller
     */
    func initialSetup() {
        // Seup SearchField
        searchField.returnKeyType = .search
        // Setup Segment Control
        toggleSegmentControl.setImage(getImageWithColor(color: #colorLiteral(red: 0.9700000286, green: 0.7099999785, blue: 0.1800000072, alpha: 1), size: CGSize(width: 80, height: 40)), forSegmentAt: 0)
        toggleSegmentControl.setImage(getImageWithColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , size: CGSize(width: 80, height: 40)), forSegmentAt: 1)
        toggleSegmentControl.addTarget(self, action: #selector(didTapSegmentControl), for: .valueChanged)
        // Hide SegmentControl
        hideSegmentControl()
        
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
    func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
        
    }
    func updateUIControls() {
        if let cellCount = gallery?.count {
            if cellCount == 0 {
                noResponseLabel.isHidden = false
                noResponseLabel.text = "Sorry, we did not find any results for your search."
                appInfoLabel.text = "Search for the top images of the week from the imgur gallery."
                hideSegmentControl()
                
            }
            else {
                noResponseLabel.isHidden = true
                appInfoLabel.text = "Switch to 'Less' for displaying results fewer in number."
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
    func refreshTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            
        }
        
    }
    
}

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
