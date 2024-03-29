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
            case let .success(imgurGallery) :
                // Reverse chronological order
                let dataArray = imgurGallery.data
                var reversedDataArray = [Gallery]()
                for item in (dataArray?.reversed())! {
                    reversedDataArray.append(item)
                }
                // Remove "video/mp4" format
                let filteredResults = reversedDataArray.filter({ (data) -> Bool in
                    return !(data.images?[0].type == ImgurContants.imageTypeVideo)
                    
                })
                self.presenter?.imageListDidFetch(gallery: filteredResults)
                
            }
            
        }
        
    }
    /*
     Sort Gallery for less results
     **/
    func sortGalleryListForLessResult(gallery: [Gallery]) {
        // Filter array based on checking whether 'points','score' and 'topic_id' add up to an even no
        let filteredDataArray = gallery.filter { ($0.points! + $0.score! + $0.topic_id!) % 2 == 0 }
        self.presenter?.filteredImageListDidFetch(gallery: filteredDataArray)
        
    }
    
}
