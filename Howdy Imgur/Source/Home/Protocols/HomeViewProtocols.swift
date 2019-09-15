//
//  HomeViewProtocols.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 14/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit

protocol HomeViewProtocol: class {
    // Presenter -> View
    func showImageList(with gallery: [Gallery])
    func showAPIError(message: String)
    
}

protocol HomeViewPresenterProtocol: class {
    // View -> Presenter
    var interactor: HomeViewInputInteractorProtocol? { get set }
    var view: HomeViewProtocol? { get set }
    var router: HomeViewRouterProtocol? { get set }
    func viewDidLoad()
    func fetchImageList(with searchKey: String)
    func sortGalleryListForLessResult(with gallery: [Gallery])
    
}

protocol HomeViewInputInteractorProtocol: class {
    // Presenter -> Interactor
    func fetchImageList(searchKey: String)
    func sortGalleryListForLessResult(gallery: [Gallery])
    var presenter: HomeViewOutputInteractorProtocol? { get set }
    
}

protocol HomeViewOutputInteractorProtocol: class {
    // Interactor -> Presenter
    func imageListDidFetch(gallery: [Gallery]?)
    func imageListDidFetchFailed(error: Error?)
    
}

protocol HomeViewRouterProtocol: class {
    // Presenter -> Router
    static func createHomeViewModule(homeViewRef: HomeViewController)
    
}
