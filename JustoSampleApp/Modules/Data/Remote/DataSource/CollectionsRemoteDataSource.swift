//
//  CollectionsRemoteDataSource.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation
import RxSwift

protocol CollectionsRemote {
    func fetchCollections(zipCode: String) -> Observable<[Collection]>
}

class CollectionsRemoteDataSource : CollectionsRemote {
  
  func fetchCollections(zipCode: String) -> Observable<[Collection]> {
    <#code#>
  }
  
  private func createFetchCollectionsQuery(zipCode: String) -> FetchCollectionsQuery {
      let collectionsFilter = CollectionFilterInput(published: CollectionPublished.published, isHidden: false)
      return FetchCollectionsQuery.init(
          first: Constants.collectionSize,
          productFirst: Constants.pageProductSize,
          filter: collectionsFilter,
          postalCode: zipCode
      )
  }
  
  private enum Constants {
      static let collectionSize = 10
      static let pageProductSize = 10
      static let pageSize = 30
  }
}
