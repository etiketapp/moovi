//
//  RequestResultCastDetailDelegate.swift
//  moovi
//
//  Created by tunay alver on 13.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

protocol RequestResultCastDetailDelegate: RequestDelegate {
    
    associatedtype ResultObjectType: Codable
    
    func didSuccess(_ result: CastDetail)
    
}

extension RequestResultCastDetailDelegate {
    
    func request(success: @escaping RequestManager.MovieCastDetailClosure, failure: @escaping RequestManager.ErrorClosure) {
        RequestManager.request(self, success: { (result: CastDetail) in
            self.didSuccess(result)
            success(result)
        }) { (error) in
            self.didError(error)
            failure(error)
        }
    }
    
    func didSuccess(_ result: CastDetail) {}
    
}
