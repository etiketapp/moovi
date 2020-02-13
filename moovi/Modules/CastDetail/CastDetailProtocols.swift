//
//  CastDetailProtocols.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol CastDetailViewToPresenterProtocol: class {
    
    var view: CastDetailPresenterToViewProtocol! { get set }
    var router: CastDetailPresenterToRouterProtocol! { get set }
    
    var tappedCast: Cast! { get set }
    var cast: CastDetail? { get set }
    
    func getCastDetail()
    
    func didTappedCastImageView()
    
}

protocol CastDetailPresenterToViewProtocol: class {
    
    func didGetError(error: ResponseError)
    func didGetCastDetail()
    
}

protocol CastDetailPresenterToRouterProtocol: class {
    
    var view: CastDetailViewController! { get set }
    func pushToImageDetail(imageUrl: String)
    
}
