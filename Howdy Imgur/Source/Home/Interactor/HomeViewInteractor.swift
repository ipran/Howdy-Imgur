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
    /*
    Sort Gallery for less results
    **/
    func sortGalleryListForLessResult(gallery: Gallery) {
        // Filter array based on checking 'points','score' and 'topic_id' add up to an even no
        let data = gallery.data?.filter { ($0.points! + $0.score! + $0.topic_id!) % 2 == 0 }
        var filteredGallery = Gallery()
        filteredGallery.status = 200
        filteredGallery.success = true
        filteredGallery.data = data
        self.presenter?.imageListDidFetch(gallery: filteredGallery)
        
    }
    
}
