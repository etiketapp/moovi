//
//  RequestResultMovieCastDelegate.swift
//  moovi
//
//  Created by tunay alver on 13.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

protocol RequestResultMovieCastDelegate: RequestDelegate {
    
    associatedtype ResultObjectType: Codable
    
    func didSuccess(_ result: MovieCast)
    
}

extension RequestResultMovieCastDelegate {
    
    func request(success: @escaping RequestManager.MovieCastClosure, failure: @escaping RequestManager.ErrorClosure) {
        RequestManager.request(self, success: { (result: MovieCast) in
            self.didSuccess(result)
            success(result)
        }) { (error) in
            self.didError(error)
            failure(error)
        }
    }
    
    func didSuccess(_ result: MovieCast) {}
    
}
