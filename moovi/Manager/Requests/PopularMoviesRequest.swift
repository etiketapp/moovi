//
//  PopularMoviesRequest.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Alamofire

struct PopularMoviesRequest: RequestResultArrayPaginationDelegate {
   
    typealias ResultObjectType = Movie
    
    var path: String = "movie/popular"
    var method: HTTPMethod = .get
    var parameters: Parameters?
    
    init(page: Int) {
        parameters = [:]
        parameters!["api_key"] = RequestManager.apiKey
        parameters!["page"] = page
    }
    
}
