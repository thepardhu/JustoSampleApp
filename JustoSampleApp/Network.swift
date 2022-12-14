//
//  Network.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 14/12/22.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()

    let url = "https://gateway.mx.justo.cloud/graphql/"
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: url)!)
}
