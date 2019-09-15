//
//  HomeViewPresenter.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 14/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit

class HomeViewPresenter: HomeViewPresenterProtocol, HomeViewOutputInteractorProtocol {
    var interactor: HomeViewInputInteractorProtocol?
    var view: HomeViewProtocol?
    var router: HomeViewRouterProtocol?
    
    func viewDidLoad() {
        // No inital data fetching
    }
    /**
     This will get called when user searches for images with a key
     */
    func fetchImageList(with searchKey: String) {
        interactor?.fetchImageList(searchKey: searchKey)
        
    }
    /**
     This will get called when user swtiches from All to Less
     */
    func sortGalleryListForLessResult(with gallery: [Gallery]) {
        interactor?.sortGalleryListForLessResult(gallery: gallery)
        
    }
    /**
     Fetch image list success call back
     */
    func imageListDidFetch(gallery: [Gallery]?) {
        if let galleryArray = gallery {
            self.view?.showImageList(with: galleryArray)
            
        } else {
            self.view?.showAPIError(message: ImgurMessages.noImagesFound)
            
        }
        
    }
    /**
     Fetch image list failed call back
     */
    func imageListDidFetchFailed(error: Error?) {
        self.view?.showAPIError(message: error?.localizedDescription ?? ImgurMessages.somethingWentWrong)
        
    }
    
}
