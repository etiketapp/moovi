//
//  MoviesViewController.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class MoviesViewController: BaseVC {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var presenter: MoviesViewToPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAppIconToNavbar()
        registerCells()
        
        self.showLoadingDialog()
        presenter.getPopularMovies()
    }
    
    //MARK: - Functions
    func registerCells() {
        tableView.register(EmptyTVCell.self)
        tableView.register(SearchBarTVCell.self)
        tableView.register(PopularMoviesTVCell.self)
        tableView.register(MovieTVCell.self)
    }
    
}

// MARK: - MoviesPresenterOutputDelegate
extension MoviesViewController: MoviesPresenterToViewProtocol {
    func didGetErro(error: ResponseError) {
        self.hideLoadingDialog()
        self.performAlert(title: "Hata", message: error.status_message, buttonTitle: "OK", style: .alert)
    }
    
    func didGetPopularMovies() {
        self.hideLoadingDialog()
        self.tableView.reloadData()
    }
    
    func didGetSearchMovies() {
        self.hideLoadingDialog()
        self.tableView.reloadData()
    }
}

//MARK: - Table View
extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    
    enum Sections: Int, CaseIterable {
        case searchBar
        case popular
        case search
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch Sections(rawValue: indexPath.section)! {
        case .searchBar:
            return UITableView.automaticDimension
        case .popular:
            return 200
        case .search:
            if presenter.searchedMovies == nil || presenter.searchedMovies?.count == 0 {
                return tableView.frame.height - 300
            }else {
                return UITableView.automaticDimension
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Sections(rawValue: section)! {
        case .searchBar:
            return 1
        case .popular:
            return 1
        case .search:
            if presenter.searchedMovies == nil || presenter.searchedMovies?.count == 0 {
                return 1
            }else {
                return presenter.searchedMovies!.count
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emptyCell: EmptyTVCell = tableView.dequeueReusableCell()
        
        switch Sections(rawValue: indexPath.section)! {
        case .searchBar:
            let cell: SearchBarTVCell = tableView.dequeueReusableCell()
            cell.delegate = self
            return cell
        case .popular:
            let cell: PopularMoviesTVCell = tableView.dequeueReusableCell()
            cell.delegate = self
            cell.movies = self.presenter.popularMovies
            cell.page = self.presenter.pageForPopular
            cell.totalPage = self.presenter.popularTotalPages
            return cell
        case .search:
            if presenter.searchedMovies == nil || presenter.searchedMovies?.count == 0 {
                return emptyCell
            }else {
                let cell: MovieTVCell = tableView.dequeueReusableCell()
                cell.movie = presenter.searchedMovies?[indexPath.row]
                return cell
            }
        }
    }
    
    //MARK: - Will Display
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard presenter.searchString != nil && presenter.searchString != "" else { return }
        if indexPath.row + 1 == self.presenter.searchedMovies?.count && self.presenter.page < self.presenter.searchedTotalPages ?? 1 {
            self.presenter.page += 1
            self.presenter.search(self.presenter.searchString)
        }
    }
    
    //MARK: - Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath) as? MovieTVCell) != nil {
            let tappedMovie = presenter.searchedMovies?[indexPath.row]
            presenter.didTappedMovie(movie: tappedMovie!)
        }
    }
    
    
}


//MARK: - Search
extension MoviesViewController: SearchBarTVCellDelegate {
    func didSearch(searchString: String?) {
        guard searchString != "" else { return }
        self.presenter.page = 1
        self.presenter.searchString = searchString
        self.presenter.search(searchString)
    }
}


//MARK: - Popular Tapped
extension MoviesViewController: PopularMoviesTVCellDelegate {
    func didTappedMovie(movie: Movie) {
        presenter.didTappedMovie(movie: movie)
    }
    
    func didPaginate(page: Int) {
        self.presenter.pageForPopular += 1
        self.presenter.getPopularMovies()
    }
}
