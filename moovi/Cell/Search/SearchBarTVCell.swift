//
//  SearchBarTVCell.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import UIKit

protocol SearchBarTVCellDelegate {
    func didSearch(searchString: String?)
}

class SearchBarTVCell: BaseTVCell, UISearchBarDelegate {
    
    @IBOutlet private weak var searchBar: UISearchBar!
    
    var delegate: SearchBarTVCellDelegate!

    override func awakeFromNib() {
        super.awakeFromNib()
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.endEditing(true)
        delegate.didSearch(searchString: searchBar.text)
    }
    
}
