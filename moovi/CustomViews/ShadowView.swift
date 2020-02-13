//
//  ShadowView.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

@IBDesignable
class ShadowView: UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 10
    @IBInspectable
    var shadowRadius: CGFloat = 10
    @IBInspectable
    var shadowColor: UIColor = UIColor.black
    @IBInspectable
    var shadowOpacity: Float = 0.2
    @IBInspectable
    var shadowOffset: CGSize = CGSize(width: 0, height: 0.8)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = false
        layer.cornerRadius = cornerRadius
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        awakeFromNib()
    }
    
}
