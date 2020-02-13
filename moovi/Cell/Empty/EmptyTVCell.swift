//
//  EmptyTVCell.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import Lottie

class EmptyTVCell: BaseTVCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var animationView: AnimationView!

    override func awakeFromNib() {
        super.awakeFromNib()
//        animate(animationView: animationView, name: "runner")
        //NOTE: - Has killed the apps performans therefore commented here...
        titleLabel.text = "Start typing to reach the force of movies !"
    }
    
}
