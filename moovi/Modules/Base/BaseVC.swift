//
//  BaseVC.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setNavigationBarBackButtonEmpty()
        
        self.view.backgroundColor = .primaryBackground
    }

}
