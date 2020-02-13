//
//  CircleView.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.width/2
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.cornerRadius = self.frame.size.width/2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
    }
    
}
