//
//  GetCollectionUseCase.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 16/12/22.
//

import Foundation
import RxSwift

class GetCollectionUseCase {
  
  private let collectionReposity: CollectionRepository
  
  init(collectionReposity: CollectionRepository) {
    self.collectionReposity = collectionReposity
  }
  
  func fetchCollection(zipCode: String) ->
  Observable<[CollectionModel]> {
    return collectionReposity.fetchCollections(zipCode: zipCode)
  }
  
}
