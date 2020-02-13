//
//  UIImageViewExtension.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImageUrl(imageUrl: String) {
        if let url = URL(string: ((imageUrl))) {
            self.kf.indicatorType = .activity
            self.kf.setImage(with: url)
        }
    }
    
    func setImageUrlMasked(imageUrl: String, color: UIColor) {
        self.tintColor = color
        if let url = URL(string: ((imageUrl))) {
            self.kf.setImage(with: url, options: [.imageModifier(RenderingModeImageModifier(renderingMode: .alwaysTemplate))])
            self.kf.indicatorType = .activity
        }
    }
    
}
