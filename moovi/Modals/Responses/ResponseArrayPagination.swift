//
//  ResponseArrayPagination.swift
//  moovi
//
//  Created by tunay alver on 13.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

class ResponseArrayPagination<T: Codable>: BaseResponse {
    
    var results: [T]!
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decode([T].self, forKey: .results)
        try super.init(from: decoder)
    }
    
}
