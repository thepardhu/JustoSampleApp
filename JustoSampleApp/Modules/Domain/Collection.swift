//
//  Collection.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation

struct Collection {
    var id: String
    var name: String
    var slug: String
    var isBanner: Bool
    var isFullBanner: Bool
    var isHidden: Bool
    var description: String
    var backgroundImage: String
    var backgroundColor: String
    var productInfo: ProductInfo
    var categories: [Category]
    
    init(id: String = String.empty,
         name: String = String.empty,
         slug: String = String.empty,
         isBanner: Bool = false,
         isFullBanner: Bool = false,
         isHidden: Bool = false,
         description: String = String.empty,
         backgroundImage: String = String.empty,
         backgroundColor: String = String.empty,
         productInfo: ProductInfo = ProductInfo(),
         categories: [Category] = []) {
        self.id = id
        self.name = name
        self.slug = slug
        self.isBanner = isBanner
        self.isFullBanner = isFullBanner
        self.isHidden = isHidden
        self.description = description
        self.backgroundImage = backgroundImage
        self.backgroundColor = backgroundColor
        self.productInfo = productInfo
        self.categories = categories
    }
}
