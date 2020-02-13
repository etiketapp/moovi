//
//  MovieCastRequest.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Alamofire

struct MovieCastRequest: RequestResultMovieCastDelegate {
   
    typealias ResultObjectType = MovieCast
    
    var path: String = "movie"
    var method: HTTPMethod = .get
    var parameters: Parameters?
    
    init(id: Int) {
        path = "movie/\(id)/credits"
        parameters = [:]
        parameters!["api_key"] = RequestManager.apiKey
    }
    
}
