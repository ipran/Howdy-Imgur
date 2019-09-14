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
    @IBOutlet weak var segmentControlViewHeightConstraint: NSLayoutConstraint!
    
    
    // Delclarations
    var presenter: HomeViewPresenterProtocol?
    var gallery: Gallery?
    
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
        activityIndicatorView.startAnimating()
        presenter?.viewDidLoad()
        
    }
    
}

// MARK: - Presenter Protocols
extension HomeViewController: HomeViewProtocol {
    func showImageList(with gallery: Gallery) {
        self.noResponseLabel.isHidden = true
        self.gallery = gallery
        self.activityIndicatorView.stopAnimating()
        self.tableView.reloadData()
        
    }
    func showAPIError(message: String) {
        self.noResponseLabel.isHidden = false
        self.noResponseLabel.text = message
        self.activityIndicatorView.stopAnimating()
        
    }
    
}

// MARK: - Tableview Delegate & Datasource
extension HomeViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gallery?.data.count ?? 0
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GalleryImageTableViewCell.identifier) as! GalleryImageTableViewCell
        
        guard let data = gallery?.data[indexPath.row] else {
            return cell
        }
        cell.titleLabel.text = data.title
        cell.imageCountLabel.text = data.imagesCount as! String
//        cell.imageView?.image = data.images?[0].link
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
        // Setup Segment Control
        toggleSegmentControl.setImage(getImageWithColor(color: #colorLiteral(red: 0.9700000286, green: 0.7099999785, blue: 0.1800000072, alpha: 1), size: CGSize(width: 80, height: 40)), forSegmentAt: 0)
        toggleSegmentControl.setImage(getImageWithColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , size: CGSize(width: 80, height: 40)), forSegmentAt: 1)
        toggleSegmentControl.addTarget(self, action: #selector(didTapSegmentControl), for: .valueChanged)
        
        setupViews()
        
    }
    func setupViews() {
        // Don't show segment control initially
//        segmentControlViewHeightConstraint.constant = 0
        
    }
    @objc func didTapSegmentControl(segmentControl: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex {
            
        case 0:
            break
            
        case 1:
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
    
}
