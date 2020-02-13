//
//  CastDetailRequest.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Alamofire

struct CastDetailRequest: RequestResultCastDetailDelegate {
   
    typealias ResultObjectType = CastDetail
    
    var path: String = "person"
    var method: HTTPMethod = .get
    var parameters: Parameters?
    
    init(id: Int) {
        path = "person/\(id)"
        parameters = [:]
        parameters!["api_key"] = RequestManager.apiKey
    }
    
}
