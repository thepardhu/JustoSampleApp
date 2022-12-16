//
//  CollectionsRemoteDataSource.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation
import RxSwift

protocol CollectionsRemote {
    func fetchCollections(zipCode: String) -> Observable<[CollectionModel]>
}

class CollectionsRemoteDataSource : CollectionsRemote {
  
  private let apolloClientBuilder: ApolloClientBuilder
  
  init(apolloClientBuilder: ApolloClientBuilder) {
      self.apolloClientBuilder = apolloClientBuilder
  }
 
  func fetchCollections(zipCode: String) -> Observable<[CollectionModel]> {
    return apolloClientBuilder.buildRX([.authorization: String.empty])
          .fetch(query: createFetchCollectionsQuery(zipCode: zipCode))
          .compactMap { $0.collections?.edges.compactMap{ $0?.node?.asCollection() }}
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
