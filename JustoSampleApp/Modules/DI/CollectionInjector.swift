//
//  CollectionInjector.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 16/12/22.
//

import Foundation

enum CollectionInjector {
  
  private static func provideCollectionRemoteDataSource() ->
  CollectionsRemoteDataSource {
    CollectionsRemoteDataSource(apolloClientBuilder: ApolloClientBuilder())
  }
  
  private static func provideCollectionRepository() ->
  CollectionRepository {
    CollectionRepository(collectionsRemote: provideCollectionRemoteDataSource())
  }
  
  static func provideGetCollectionUseCase() ->
   GetCollectionUseCase {
     GetCollectionUseCase(collectionReposity: provideCollectionRepository())
  }
  
}
