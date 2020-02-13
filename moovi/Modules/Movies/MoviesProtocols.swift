//
//  MoviesProtocols.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol MoviesViewToPresenterProtocol: class {
    
    var view: MoviesPresenterToViewProtocol! { get set }
    var router: MoviesPresenterToRouterProtocol! { get set }
    
    //MARK: - Properties Popular
    var popularMovies: [Movie]? { get set }
    var popularTotalResults: Int? { get set }
    var popularTotalPages: Int? { get set }
    var pageForPopular: Int! { get set }
    
    //MARK: - Properties Searched
    var searchedMovies: [Movie]? { get set }
    var searchedTotalResults: Int? { get set }
    var searchedTotalPages: Int? { get set }
    var page: Int! { get set }
    var searchString: String? { get set }
    
    func getPopularMovies()
    func search(_ searchString: String?)
    
    func didTappedMovie(movie: Movie)
    
}

protocol MoviesPresenterToViewProtocol: class {
    
    func didGetErro(error: ResponseError)
    func didGetPopularMovies()
    func didGetSearchMovies()
    
}

protocol MoviesPresenterToRouterProtocol: class {
    
    var view: MoviesViewController! { get set }
    func pushToMovieDetail(movie: Movie)
    
}

