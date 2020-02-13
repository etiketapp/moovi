//
//  UICollectionViewCellExtension.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import Lottie

extension UICollectionViewCell {
    
    //MARK: - Not Found
    func animate(animationView: AnimationView, name: String) {
        let animation = Animation.named(name)
        animationView.loopMode = .loop
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFill
        animationView.play()
    }
    
}
