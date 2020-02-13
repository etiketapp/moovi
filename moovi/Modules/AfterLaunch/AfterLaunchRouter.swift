//
//  AfterLaunchRouter.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class AfterLaunchRouter: AfterLaunchPresenterToRouterProtocol {
    
    var view: AfterLaunchViewController!
    
    class func createAfterLaunchModule() -> AfterLaunchViewController {
        
        let view: AfterLaunchViewController = storyboard.instantiateViewController()
        let presenter: AfterLaunchViewToPresenterProtocol = AfterLaunchPresenter()
        let router: AfterLaunchPresenterToRouterProtocol = AfterLaunchRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        router.view = view
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "AfterLaunch", bundle: Bundle.main)
    }
    
    func pushToMovies() {
        let movies = MoviesRouter.createMoviesModule()
        let navigationController = BaseNavigationController(rootViewController: movies)
        AppDelegate.shared.goToScreen(view: navigationController)
    }

}
