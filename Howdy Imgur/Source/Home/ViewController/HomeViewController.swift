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
        presenter?.viewDidLoad()
        
    }
    func initialSetup() {
        // Setup Segment Control
        segmentControlContainer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        toggleSegmentControl.setImage(getImageWithColor(color: #colorLiteral(red: 0.9700000286, green: 0.7099999785, blue: 0.1800000072, alpha: 1), size: CGSize(width: 80, height: 40)), forSegmentAt: 0)
        toggleSegmentControl.setImage(getImageWithColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) , size: CGSize(width: 80, height: 40)), forSegmentAt: 1)
        toggleSegmentControl.addTarget(self, action: #selector(didTapSegmentControl), for: .valueChanged)
        
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
