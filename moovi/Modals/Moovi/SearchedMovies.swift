//
//  SearchedMovies.swift
//  moovi
//
//  Created by tunay alver on 13.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

struct SearchedMovies: Codable {
    
    var page: Int!
    var total_results: Int!
    var total_pages: Int!
    var results: [Movie]!
    
}
