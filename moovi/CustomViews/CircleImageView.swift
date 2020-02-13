//
//  CircleImageView.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        awakeFromNib()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        awakeFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.cornerRadius = self.frame.size.width/2
    }
    
}
