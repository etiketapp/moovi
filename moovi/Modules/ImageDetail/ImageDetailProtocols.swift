//
//  ImageDetailProtocols.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol ImageDetailViewToPresenterProtocol: class {
    
    var view: ImageDetailPresenterToViewProtocol! { get set }
    var router: ImageDetailPresenterToRouterProtocol! { get set }
    
    var imageUrl: String! { get set }
    
}

protocol ImageDetailPresenterToViewProtocol: class {
    
}

protocol ImageDetailPresenterToRouterProtocol: class {
    
}
