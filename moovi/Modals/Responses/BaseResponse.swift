//
//  BaseResponse.swift
//  moovi
//
//  Created by tunay alver on 13.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

class BaseResponse: Codable {
    
    var page: Int!
    var total_results: Int!
    var total_pages: Int!
    
}
