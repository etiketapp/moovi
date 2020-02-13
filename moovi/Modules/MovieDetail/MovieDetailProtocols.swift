//
//  MovieDetailProtocols.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol MovieDetailViewToPresenterProtocol: class {
    
    var view: MovieDetailPresenterToViewProtocol! { get set }
    var router: MovieDetailPresenterToRouterProtocol! { get set }
    
    //MARK: - Properties
    var tappedMovie: Movie! { get set }
    var movie: MovieDetail? { get set }
    var casts: [Cast]? { get set }
    var tappedCast: Cast! { get set }
    
    func getMovieDetail()
    func getCasts()
    
    func didTappedCast(cast: Cast)
    func didTappedPosterImageView()
    
}

protocol MovieDetailPresenterToViewProtocol: class {
    
    func didGetError(error: ResponseError)
    func didGetMovieDetail(movieDetail: MovieDetail)
    func didGetCasts(casts: [Cast]?)
    
}

protocol MovieDetailPresenterToRouterProtocol: class {
    
    var view: MovieDetailViewController! { get set }
    
    func pushToCastDetail(tappedCast: Cast)
    func pushToImageDetail(imageUrl: String)
    
}
