//
//  ApolloRequestError.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation

enum ApolloRequestError: Error {
    case connectionNetwork
    case expiredAuthToken(String)
    case invalidAuthToken(String)
    case graphQL(String)
    case unknown

    var localizedDescription: String {
        switch self {
        case .connectionNetwork:
            return .localizeString(for: "No internet connection Label")
        case .expiredAuthToken(let message), .invalidAuthToken(let message), .graphQL(let message):
            return message
        default:
            return .localizeString(for: "Error Unknown")
        }
    }
    
    init(from errorMessage: String) {
        guard let error = GraphQLExceptionError(rawValue: errorMessage) else {
            self = .graphQL(errorMessage)
            return
        }
        switch error {
        case .signatureExpired:
            self = .expiredAuthToken(errorMessage)
        case .signatureInvalid:
            self = .invalidAuthToken(errorMessage)
        }
    }
    
    init(from error: Error) {
        if let apolloRequestError = error as? ApolloRequestError {
            self = apolloRequestError
        } else {
            self = .unknown
        }
    }
}
