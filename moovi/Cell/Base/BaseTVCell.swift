//
//  BaseTVCell.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

class BaseTVCell: UITableViewCell, NibLoadableView, ReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .primaryBackground
        self.selectionStyle = .none
    }

}
