//
//  BaseNavigationController.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.backgroundColor = .primaryBackground
        navigationBar.tintColor = .buttonNavigationBackPrimary
        navigationBar.shadowImage = UIImage()
        
    }

}
