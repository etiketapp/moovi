//
//  MovieDetailPresenter.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class MovieDetailPresenter: MovieDetailViewToPresenterProtocol {
    
    var view: MovieDetailPresenterToViewProtocol!
    var router: MovieDetailPresenterToRouterProtocol!
    
    var tappedMovie: Movie!
    var movie: MovieDetail?
    var casts: [Cast]?
    var tappedCast: Cast!
    
    func getMovieDetail() {
        let request = MovieDetailRequest(id: tappedMovie.id)
        request.request(success: { (response) in
            self.movie = response
            self.view.didGetMovieDetail(movieDetail: response)
        }) { (error) in
            self.view.didGetError(error: error)
        }
    }
    
    func getCasts() {
        let request = MovieCastRequest(id: tappedMovie.id)
        request.request(success: { (response) in
            self.casts = response.cast
            self.view.didGetCasts(casts: response.cast)
        }) { (error) in
            self.view.didGetError(error: error)
        }
    }
    
    func didTappedCast(cast: Cast) {
        router.pushToCastDetail(tappedCast: cast)
    }
    
    func didTappedPosterImageView() {
        guard movie!.poster_path != nil else { return }
        router.pushToImageDetail(imageUrl: movie!.poster_path)
    }
    
}
