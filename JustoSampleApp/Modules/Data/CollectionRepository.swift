//
//  CollectionRepository.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 16/12/22.
//

import Foundation
import RxSwift

class CollectionRepository {
  private let collectionsRemote: CollectionsRemote
  
  init(collectionsRemote: CollectionsRemote){
    self.collectionsRemote = collectionsRemote
  }
  
  func fetchCollections(zipCode: String) ->
  Observable<[CollectionModel]> {
    collectionsRemote.fetchCollections(zipCode: zipCode)
  }
}
