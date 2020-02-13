//
//  MovieDetail.swift
//  moovi
//
//  Created by tunay alver on 13.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

struct MovieDetail: Codable {
    
    var popularity: Double!
    var vote_count: Int!
    var vote_average: Double!
    var video: Bool!
    var poster_path: String!
    var id: Int!
    var backdrop_path: String!
    var title: String!
    var overview: String!
    var release_date: String!
    var budget: Double!
    
}
