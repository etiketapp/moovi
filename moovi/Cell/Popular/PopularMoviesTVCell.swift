//
//  PopularMoviesTVCell.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol PopularMoviesTVCellDelegate {
    func didTappedMovie(movie: Movie)
    func didPaginate(page: Int)
}

class PopularMoviesTVCell: BaseTVCell {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var movies: [Movie]! {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var page: Int!
    var totalPage: Int!
    var delegate: PopularMoviesTVCellDelegate!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        registerCells()
    }
    
    //MARK: - Functions
    func registerCells() {
        collectionView.register(MovieCVCell.self)
    }
    
}

//MARK: - CollectionView DataSource and Delegate
extension PopularMoviesTVCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCVCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.movie = movies?[indexPath.row]
        return cell
    }
    
    //MARK: - Did Select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView.cellForItem(at: indexPath) as? MovieCVCell) != nil {
            delegate.didTappedMovie(movie: movies![indexPath.row])
        }
    }
    
    //MARK: - Will Display
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row + 1 == self.movies?.count && self.page < self.totalPage ?? 1 {
            self.delegate.didPaginate(page: page)
        }
    }
    
}

//MARK: - CollectionView Flow Layout
extension PopularMoviesTVCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        return CGSize(width: height * 3/2 - 30, height: height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0)
    }
    
}
