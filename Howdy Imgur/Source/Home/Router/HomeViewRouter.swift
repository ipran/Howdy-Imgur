//
//  HomeViewRouter.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 14/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import Foundation

class HomeViewRouter: HomeViewRouterProtocol {
    /**
     Assemble home module
     */
    static func createHomeViewModule(homeViewRef: HomeViewController) {
        let presenter : HomeViewPresenterProtocol & HomeViewOutputInteractorProtocol = HomeViewPresenter()
        presenter.router = HomeViewRouter()
        presenter.view = homeViewRef as? HomeViewProtocol
        presenter.interactor = HomeViewInteractor(presenter: presenter)
        homeViewRef.presenter = presenter
        
    }
    
}
