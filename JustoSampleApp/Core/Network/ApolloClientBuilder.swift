//
//  ApolloClientBuilder.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation
import Apollo

class ApolloClientBuilder {
  
  private let configuration = URLSessionConfiguration.default
  let url = "https://gateway.mx.justo.cloud/graphql/"
  
  func buildRX(_ additionalHeaders: [HeaderConstant: String] = [:]) -> RXApollo {
    build(additionalHeaders).RXapollo
  }
  
  private func build(_ additionalHeaders: [HeaderConstant: String]) -> ApolloClient {
      withHeaders(additionalHeaders).createApolloClient()
  }
  
  private func createApolloClient() -> ApolloClient {
      ApolloClient(networkTransport: createHTTPNetworkTransport())
  }
  
  private func createHTTPNetworkTransport() -> HTTPNetworkTransport {
      HTTPNetworkTransport(url: URL(string: url)!,
                           session: URLSession(configuration: configuration))
  }
  
  private func withHeaders(_ additionalHeaders: [HeaderConstant: String]) -> ApolloClientBuilder {
    var headers: [String: String] = [HeaderConstant.justoApiKey.rawValue: String.empty,
                                       HeaderConstant.userAgent.rawValue: HeaderConstant.userAgentValue.rawValue]
      for (key, value) in additionalHeaders {
          headers[key.rawValue] = value
      }
      configuration.httpAdditionalHeaders = headers
      return self
  }
}

enum HeaderConstant: String {
    case justoApiKey = "Justo-Api-key"
    case userAgent = "User-Agent"
    case userAgentValue = "ios-app"
    case authorization = "Authorization"
    case allowElastic = "x-allow-elastic"
}
