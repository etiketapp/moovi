//
//  AfterLaunchPresenter.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class AfterLaunchPresenter: AfterLaunchViewToPresenterProtocol {

    var view: AfterLaunchPresenterToViewProtocol!
    var router: AfterLaunchPresenterToRouterProtocol!
    
    func launch() {
        view.didLaunch()
    }
    
    func shouldPushToMovies() {
        router.pushToMovies()
    }
    
}
