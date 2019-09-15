//
//  HomeViewInteractor.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 14/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

class HomeViewInteractor: HomeViewInputInteractorProtocol {
    weak var presenter: HomeViewOutputInteractorProtocol?
    var apiManager = ImgurAPIManager()
    
    init(presenter: HomeViewOutputInteractorProtocol) {
        self.presenter = presenter
        
    }
    /*
     Fetch all images
     **/
    func fetchImageList(searchKey: String) {
        apiManager.fetchDataforInputText(queryParameter: searchKey) { (response) in
            switch(response) {
                
            case let .failure(error) :
                self.presenter?.imageListDidFetchFailed(error: error)
            case let .success(gallery) :
                self.presenter?.imageListDidFetch(gallery: gallery)
                
            }
            
        }
        
    }
    
}
