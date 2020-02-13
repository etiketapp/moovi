//
//  ImageDetailPresenter.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class ImageDetailPresenter: ImageDetailViewToPresenterProtocol {
    
    var view: ImageDetailPresenterToViewProtocol!
    var router: ImageDetailPresenterToRouterProtocol!
    
    var imageUrl: String!
    
}
