//
//  CodableExtension.swift
//  moovi
//
//  Created by tunay alver on 14.02.2020.
//  Copyright © 2020 tunay alver. All rights reserved.
//

import Foundation

extension Encodable {
    
    func encode() -> Data? {
        let encoder = JSONEncoder()
        encoder.dataEncodingStrategy = .deferredToData
        return try? encoder.encode(self)
    }
    
}

extension Decodable {
    
    static func decode(_ data: Data) -> Self? {
        let decoder = JSONDecoder()
        decoder.dataDecodingStrategy = .deferredToData
        return try? decoder.decode(self, from: data)
    }
    
}
