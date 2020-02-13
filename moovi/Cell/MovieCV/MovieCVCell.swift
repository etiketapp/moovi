//
//  MovieCVCell.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import Lottie

class MovieCVCell: BaseCVCell {
    
    @IBOutlet private weak var animationView: AnimationView!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var voteLabel: UILabel!
    @IBOutlet private weak var popularityLabel: UILabel!

    var movie: Movie! {
        didSet {
            if let url = movie.poster_path {
                let imageUrl = RequestManager.imageInitialPath + url
                movieImageView.setImageUrl(imageUrl: imageUrl)
                animationView.isHidden = true
            }else {
                animationView.isHidden = false
                animate(animationView: animationView, name: "notFound")
            }
            titleLabel.text = movie?.title
            voteLabel.text = "\(movie?.vote_count ?? 0)"
            popularityLabel.text = "\(movie?.popularity ?? 0)"
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
