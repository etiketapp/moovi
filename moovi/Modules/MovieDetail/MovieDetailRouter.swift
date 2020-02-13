//
//  MovieDetailRouter.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class MovieDetailRouter: MovieDetailPresenterToRouterProtocol {
    
    var view: MovieDetailViewController!
    
    class func createMovieDetailModule(movie: Movie) -> MovieDetailViewController {
        let view: MovieDetailViewController = storyboard.instantiateViewController()
        let presenter: MovieDetailViewToPresenterProtocol = MovieDetailPresenter()
        let router: MovieDetailPresenterToRouterProtocol = MovieDetailRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        presenter.tappedMovie = movie
        
        router.view = view
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "MovieDetail", bundle: Bundle.main)
    }
    
    func pushToCastDetail(tappedCast: Cast) {
        let castDetail = CastDetailRouter.createCastDetailModule(tappedCast: tappedCast)
        view.navigationController?.pushViewController(castDetail, animated: true)
    }
    
    func pushToImageDetail(imageUrl: String) {
        let imageDetail = ImageDetailRouter.createImageDetailModule(imageUrl: imageUrl)
        imageDetail.modalPresentationStyle = .overCurrentContext
        view.present(imageDetail, animated: true, completion: nil)
    }
    
}
