//
//  MovieDetailViewController.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import Lottie

class MovieDetailViewController: BaseVC {

    // MARK: - Outlets
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var animationView: AnimationView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var castBackgroundView: UIView!
    @IBOutlet private weak var castCollectionView: UICollectionView!
    @IBOutlet private weak var stackTopToCast: NSLayoutConstraint!
    @IBOutlet private weak var stackTopToImage: NSLayoutConstraint!
    
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var budgetLabel: UILabel!
    @IBOutlet private weak var popularityLabel: UILabel!
    @IBOutlet private weak var voteAverageLabel: UILabel!
    @IBOutlet private weak var voteCountLabel: UILabel!
    
    // MARK: - Properties
    var presenter: MovieDetailViewToPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        castCollectionView.register(CastCVCell.self)
        addGestures()
        
        presenter.getMovieDetail()
        presenter.getCasts()
    }
    
    //MARK: - Functions
    func addGestures() {
        posterImageView.isUserInteractionEnabled = true
        posterImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(posterImageViewTapped)))
    }
    
    @objc func posterImageViewTapped() {
        presenter.didTappedPosterImageView()
    }
    
    func fill(_ movie: MovieDetail?) {
        if let url = movie?.poster_path {
            let imageUrl = RequestManager.imageInitialPath + url
            posterImageView.setImageUrl(imageUrl: imageUrl)
            animationView.isHidden = true
        }else {
            animationView.isHidden = false
            self.animate(animationView: animationView, name: "notFound")
        }
        titleLabel.text = movie?.title
        overviewLabel.text = movie?.overview
        dateLabel.text = movie?.release_date
        budgetLabel.text = "\(movie?.budget ?? 0)"
        popularityLabel.text = "\(movie?.popularity ?? 0)"
        voteAverageLabel.text = "\(movie?.vote_average ?? 0)"
        voteCountLabel.text = "\(movie?.vote_count ?? 0)"
    }
    
}

// MARK: - MovieDetailPresenterOutputDelegate
extension MovieDetailViewController: MovieDetailPresenterToViewProtocol {
    
    func didGetError(error: ResponseError) {
        self.hideLoadingDialog()
        self.performAlert(title: "Hata", message: error.status_message, buttonTitle: "OK", style: .alert)
    }
    
    func didGetMovieDetail(movieDetail: MovieDetail) {
        self.fill(movieDetail)
    }
    
    func didGetCasts(casts: [Cast]?) {
        if casts?.count == 0 {
            stackTopToCast.priority = UILayoutPriority(rawValue: 250)
            stackTopToImage.priority = UILayoutPriority(rawValue: 750)
        }else {
            stackTopToCast.priority = UILayoutPriority(rawValue: 750)
            stackTopToImage.priority = UILayoutPriority(rawValue: 250)
        }
        self.castCollectionView.reloadData()
    }
    
}

//MARK: - CollectionView DataSource and Delegate
extension MovieDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.casts?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CastCVCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.cast = presenter.casts?[indexPath.row]
        return cell
    }
    
    //MARK: - Did Select
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView.cellForItem(at: indexPath) as? CastCVCell) != nil {
            let tappedCast = presenter.casts?[indexPath.row]
            presenter.didTappedCast(cast: tappedCast!)
        }
    }
    
}
