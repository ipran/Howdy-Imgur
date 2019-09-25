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
        return CGFloat(ImgurContants.homeTableViewCellHeight)
        
    }
    
}
