//
//  SearchMoviesRequest.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Alamofire

struct SearchMoviesRequest: RequestResultArrayPaginationDelegate {
   
    typealias ResultObjectType = Movie
    
    var path: String = "search/movie"
    var method: HTTPMethod = .get
    var parameters: Parameters?
    
    init(page: Int, query: String) {
        parameters = [:]
        parameters!["api_key"] = RequestManager.apiKey
        parameters!["page"] = page
        parameters!["query"] = query
    }
    
}
