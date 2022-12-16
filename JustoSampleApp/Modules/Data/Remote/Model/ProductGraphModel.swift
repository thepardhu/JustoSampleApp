//
//  ProductGraphModel.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation

extension ProductFragment {
  
  func asProduct(isRecommend: Bool = false, selectedVariantId: String = .empty, isFromLogin: Bool = false) -> Product {
      return Product(id: id,
                     name: name,
                     thumbnail: thumbnail?.url ?? String.empty,
                     isPublished: isPublished)
  }
}
