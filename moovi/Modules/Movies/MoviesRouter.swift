//
//  MoviesRouter.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class MoviesRouter: MoviesPresenterToRouterProtocol {
    
    var view: MoviesViewController!
    
    class func createMoviesModule() -> MoviesViewController {
        let view: MoviesViewController = storyboard.instantiateViewController()
        let presenter: MoviesViewToPresenterProtocol = MoviesPresenter()
        let router: MoviesPresenterToRouterProtocol = MoviesRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        
        presenter.pageForPopular = 1
        presenter.page = 1
        
        router.view = view
        
        return view
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Movies", bundle: Bundle.main)
    }
    
    func pushToMovieDetail(movie: Movie) {
        let movieDetail = MovieDetailRouter.createMovieDetailModule(movie: movie)
        view.navigationController?.pushViewController(movieDetail, animated: true)
    }

}
