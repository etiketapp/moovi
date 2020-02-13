//
//  CastDetailPresenter.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class CastDetailPresenter: CastDetailViewToPresenterProtocol {
    
    var view: CastDetailPresenterToViewProtocol!
    var router: CastDetailPresenterToRouterProtocol!
    
    var tappedCast: Cast!
    var cast: CastDetail?
    
    func getCastDetail() {
        let request = CastDetailRequest(id: tappedCast.id)
        request.request(success: { (response) in
            self.cast = response
            self.view.didGetCastDetail()
        }) { (error) in
            self.view.didGetError(error: error)
        }
    }
    
    func didTappedCastImageView() {
        guard cast!.profile_path != nil else { return }
        router.pushToImageDetail(imageUrl: cast!.profile_path)
    }
    
}
