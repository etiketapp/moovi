//
//  CastDetailRouter.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class CastDetailRouter: CastDetailPresenterToRouterProtocol {
    
    var view: CastDetailViewController!
    
    class func createCastDetailModule(tappedCast: Cast) -> CastDetailViewController {
        let view: CastDetailViewController = storyboard.instantiateViewController()
        let presenter: CastDetailViewToPresenterProtocol = CastDetailPresenter()
        let router: CastDetailPresenterToRouterProtocol = CastDetailRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        router.view = view
        presenter.tappedCast = tappedCast
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "CastDetail", bundle: Bundle.main)
    }

    func pushToImageDetail(imageUrl: String) {
        let imageDetail = ImageDetailRouter.createImageDetailModule(imageUrl: imageUrl)
        imageDetail.modalPresentationStyle = .overCurrentContext
        view.present(imageDetail, animated: true, completion: nil)
    }
    
}
