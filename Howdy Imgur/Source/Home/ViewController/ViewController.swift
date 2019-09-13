//
//  ViewController.swift
//  Howdy Imgur
//
//  Created by Pranil V P on 13/09/19.
//  Copyright © 2019 Pranil V P. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let apiManager = ImgurAPIManager(configuration: .default)
        apiManager.fetchDataforInputText(queryParameter: "dog") { (response) in
            switch(response) {
            case let .failure(error) :
                    print(error.localizedDescription)
            case let .success(result) :
                print(result)
            }
        }
    }


}

