//
//  MoviesPresenter.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class MoviesPresenter: MoviesViewToPresenterProtocol {
    
    var view: MoviesPresenterToViewProtocol!
    var router: MoviesPresenterToRouterProtocol!
    
    //MARK: - Properties Searched
    var searchedMovies: [Movie]?
    var searchedTotalResults: Int?
    var searchedTotalPages: Int?
    var page: Int!
    var searchString: String?
    
    //MARK: - Properties Popular
    var popularMovies: [Movie]?
    var popularTotalResults: Int?
    var popularTotalPages: Int?
    var pageForPopular: Int!
    
    //MARK: - Popular
    func getPopularMovies() {
        let requet = PopularMoviesRequest(page: self.pageForPopular)
        requet.request(success: { (response) in
            self.popularTotalResults = response.total_results
            self.popularTotalPages = response.total_pages
            
            if self.pageForPopular == 1 {
                self.popularMovies = response.results
            }else {
                self.popularMovies?.append(contentsOf: response.results)
            }
            
            self.view.didGetPopularMovies()
        }) { (error) in
            self.view.didGetErro(error: error)
        }
    }
    
    //MARK: - Search
    func search(_ searchString: String?) {
        
        let request = SearchMoviesRequest(page: self.page, query: searchString!)
        request.request(success: { (response) in
            self.searchedTotalResults = response.total_results
            self.searchedTotalPages = response.total_pages
            
            if self.page == 1 {
                self.searchedMovies = response.results
            }else {
                self.searchedMovies?.append(contentsOf: response.results)
            }
            
            self.view.didGetSearchMovies()
        }) { (error) in
            self.view.didGetErro(error: error)
        }
    }
    
    //MARK: - Tapped
    func didTappedMovie(movie: Movie) {
        router.pushToMovieDetail(movie: movie)
    }
    
}
