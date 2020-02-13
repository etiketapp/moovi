//
//  MovieDetailRequest.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Alamofire

struct MovieDetailRequest: RequestResultMovieDetailDelegate {
   
    typealias ResultObjectType = MovieDetail
    
    var path: String = "movie"
    var method: HTTPMethod = .get
    var parameters: Parameters?
    
    init(id: Int) {
        path = "movie/\(id)"
        parameters = [:]
        parameters!["api_key"] = RequestManager.apiKey
    }
    
}
