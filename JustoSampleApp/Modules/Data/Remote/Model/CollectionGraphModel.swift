//
//  CollectionGraphModel.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation

extension FetchCollectionsQuery.Data.Collection.Edge.Node {
    
    func asCollection() -> CollectionModel {
        return CollectionModel(
                          productInfo:  self.products?.asProductInfo() ?? ProductInfo(hasNext: false, endCursor: "", products: []))
    }
}

extension FetchCollectionsQuery.Data.Collection.Edge.Node.Product {
    
    func asProductInfo() -> ProductInfo {
        
        return ProductInfo(products: self.asProducts() )
    }
}

extension FetchCollectionsQuery.Data.Collection.Edge.Node.Product {
    
   func asProducts() -> [Product] {
        return edges
            .map { graphProduct in graphProduct.node.fragments.productFragment.asProduct() }
            .filter { product in product.isPublished == true }
    }
}
