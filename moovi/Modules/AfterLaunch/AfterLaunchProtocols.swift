//
//  AfterLaunchProtocols.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol AfterLaunchViewToPresenterProtocol: class {
    
    var view: AfterLaunchPresenterToViewProtocol! { get set }
    var router: AfterLaunchPresenterToRouterProtocol! { get set }
    
    func shouldPushToMovies()
    func launch()
    
}

protocol AfterLaunchPresenterToViewProtocol: class {
    
    func didLaunch()
    
}

protocol AfterLaunchPresenterToRouterProtocol: class {
    
    var view: AfterLaunchViewController! { get set }
    
    func pushToMovies()
    
}
