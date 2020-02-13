//
//  RequestResultMovieDetailDelegate.swift
//  moovi
//
//  Created by tunay alver on 13.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

protocol RequestResultMovieDetailDelegate: RequestDelegate {
    
    associatedtype ResultObjectType: Codable
    
    func didSuccess(_ result: MovieDetail)
    
}

extension RequestResultMovieDetailDelegate {
    
    func request(success: @escaping RequestManager.MovieDetailClosure, failure: @escaping RequestManager.ErrorClosure) {
        RequestManager.request(self, success: { (result: MovieDetail) in
            self.didSuccess(result)
            success(result)
        }) { (error) in
            self.didError(error)
            failure(error)
        }
    }
    
    func didSuccess(_ result: MovieDetail) {}
    
}
