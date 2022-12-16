//
//  ProductInfo.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation

struct ProductInfo {
    var products: [Product]
    
    init(hasNext: Bool = false,
         endCursor: String = .empty,
         queryId: String = .empty,
         products: [Product] = []) {
        self.products = products
    }
}
