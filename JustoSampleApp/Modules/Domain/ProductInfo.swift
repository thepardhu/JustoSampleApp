//
//  ProductInfo.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation

struct ProductInfo {
    var hasNext: Bool
    var endCursor: String
    var queryId: String
    var products: [Product]
    
    init(hasNext: Bool = false,
         endCursor: String = .empty,
         queryId: String = .empty,
         products: [Product] = []) {
        self.hasNext = hasNext
        self.endCursor = endCursor
        self.queryId = queryId
        self.products = products
    }
}
