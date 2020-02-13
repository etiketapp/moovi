//
//  ImageDetailRouter.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class ImageDetailRouter: ImageDetailPresenterToRouterProtocol {
    
    class func createImageDetailModule(imageUrl: String) -> ImageDetailViewController {
        let view: ImageDetailViewController = storyboard.instantiateViewController()
        let presenter: ImageDetailViewToPresenterProtocol = ImageDetailPresenter()
        let router: ImageDetailPresenterToRouterProtocol = ImageDetailRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        presenter.imageUrl = imageUrl
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "ImageDetail", bundle: Bundle.main)
    }

}
