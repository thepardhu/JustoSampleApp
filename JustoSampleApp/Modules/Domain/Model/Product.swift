//
//  Product.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation

struct Product {
  
  var id: String
  var name: String
  var thumbnail: String
  var isPublished: Bool
  
  init(id: String = String.empty, name: String = String.empty, thumbnail: String = String.empty, isPublished: Bool = false) {
    self.id = id
    self.name = name
    self.thumbnail = thumbnail
    self.isPublished = isPublished
  }
}
