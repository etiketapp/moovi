//
//  CorneredView.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

@IBDesignable
class CorneredView: UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.cornerRadius = cornerRadius
        self.backgroundColor = .primaryBackground
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        awakeFromNib()
    }
    
}
