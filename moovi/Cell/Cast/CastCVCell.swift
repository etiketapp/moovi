//
//  CastCVCell.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import Lottie

class CastCVCell: BaseCVCell {
    
    @IBOutlet private weak var animationView: AnimationView!
    @IBOutlet private weak var topLabel: UILabel!
    @IBOutlet private weak var castImageView: CircleImageView!
    @IBOutlet private weak var bottomLabel: UILabel!
    
    var cast: Cast! {
        didSet {
            if let url = cast.profile_path {
                let imageUrl = RequestManager.imageInitialPathSmall + url
                castImageView.setImageUrl(imageUrl: imageUrl)
                animationView.isHidden = true
            }else {
                animationView.isHidden = false
                animate(animationView: animationView, name: "notFound")
            }
            topLabel.text = cast.character
            bottomLabel.text = cast.name
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
