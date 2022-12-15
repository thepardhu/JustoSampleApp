//
//  RXApollo+Extension.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation
import RxSwift
import Apollo

public final class RXApollo {
  
  private let apolloClient: ApolloClient
  
  fileprivate init(_ apolloClient: ApolloClient) {
      self.apolloClient = apolloClient
  }
  
  public func fetch<Query: GraphQLQuery>(query: Query,
                                         queue: DispatchQueue = DispatchQueue.main) -> Observable<Query.Data> {
      return Observable.create { observer in
          let cancellable = self.apolloClient.fetch(query: query, queue: queue) { result in
              switch result {
              case .success(let graphQLResult):
                  if let error = graphQLResult.errors?.getError(operationName: query.operationName) {
                      observer.onError(error)
                  } else if let data = graphQLResult.data {
                      observer.onNext(data)
                      observer.onCompleted()
                  }
              case .failure(let error):
                  observer.onError(self.isNetworkException(error) ? ApolloRequestError.connectionNetwork : .unknown)
              }
          }
          return Disposables.create {
              cancellable.cancel()
          }
      }
  }
  
  public func perform<Mutation: GraphQLMutation>(mutation: Mutation,
                                                 queue: DispatchQueue = DispatchQueue.main) -> Observable<Mutation.Data> {
      return Observable.create { observer in
          let cancellable = self.apolloClient.perform(mutation: mutation, queue: queue) { result in
              switch result {
              case .success(let graphQLResult):
                  if let error = graphQLResult.errors?.getError(operationName: mutation.operationName) {
                      observer.onError(error)
                  } else if let data = graphQLResult.data {
                      observer.onNext(data)
                      observer.onCompleted()
                  }
              case .failure(let error):
                  observer.onError(self.isNetworkException(error) ? ApolloRequestError.connectionNetwork : .unknown)
              }
          }
          return Disposables.create {
              cancellable.cancel()
          }
      }
  }
  
  private func isNetworkException(_ error: Error) -> Bool {
      error.code == NetworkConstants.networkErrorCode || error.code == NetworkConstants.timeOutErrorCode
  }
}

enum GraphQLExceptionError: String {
    case signatureExpired = "Signature has expired"
    case signatureInvalid = "Signature is invalid"
}

public enum RxApolloError: Error {
    case graphQLError(String)
    case httpException(String)
}

public extension ApolloClient {
    var RXapollo: RXApollo {
        return RXApollo(self)
    }
}

extension Array where Element == GraphQLError {
    
    func getError(operationName: String) -> ApolloRequestError? {
        createApolloRequestErrors(operationName: operationName).first
    }
    
    private func createApolloRequestErrors(operationName: String) -> [ApolloRequestError] {
        map {
            let message = $0.message ?? "\(operationName) request success with errors"
            return ApolloRequestError(from: message)
        }
    }
}
