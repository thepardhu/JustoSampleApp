//
//  Collection.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation

struct CollectionModel {
  var productInfo: ProductInfo
  
  init(productInfo: ProductInfo = ProductInfo()) {
      self.productInfo = productInfo
  }
}
