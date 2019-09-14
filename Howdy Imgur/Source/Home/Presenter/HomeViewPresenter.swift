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
        interactor?.fetchImageList()
    }
    /*
     Fetch image list success call back
     **/
    func imageListDidFetch(gallery: Gallery?) {
        if let gallery = gallery {
            self.view?.showImageList(with: gallery)
            
        } else {
            self.view?.showAPIError(message: ImgurMessages.noImagesFound)
            
        }
        
    }
    /*
     Fetch image list failed call back
     **/
    func imageListDidFetchFailed(error: Error?) {
        self.view?.showAPIError(message: error?.localizedDescription ?? ImgurMessages.somethingWentWrong)
        
    }
    
}
