//
//  UIViewControllerHelper.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

struct ViewControllers {
    
    struct MoviesVC {
        private static let storyBoard = UIStoryboard(name: "MoviesVC", bundle: nil)
        static func getMoviesNC() -> BaseNavigationController {
            return storyBoard.instantiateInitialViewController() as! BaseNavigationController
        }
    }
    
    fileprivate static func getViewController(storyBoardName: String, viewControllerId: String) -> UIViewController? {
        let sb = UIStoryboard(name: storyBoardName, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: viewControllerId)
        return vc
    }
    
    fileprivate static func getNavigationController(storyBoardName: String, viewControllerId: String) -> UINavigationController? {
        let sb = UIStoryboard(name: storyBoardName, bundle: nil)
        let nc = sb.instantiateViewController(withIdentifier: viewControllerId) as! UINavigationController
        return nc
    }
    
    fileprivate static func getTabBarController(storyBoardName: String, viewControllerId: String) -> UITabBarController? {
        let sb = UIStoryboard(name: storyBoardName, bundle: nil)
        let nc = sb.instantiateViewController(withIdentifier: viewControllerId) as! UITabBarController
        return nc
    }
    
}
