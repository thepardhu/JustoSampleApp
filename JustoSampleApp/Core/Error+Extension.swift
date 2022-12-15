//
//  Error+Extension.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation

extension Error {
    
    var description: String {
        if isRequestException {
            return handleException(self)
        }
        return self.localizedDescription
    }
    
    var code: Int {
        return (self as NSError).code
    }
    
    var domain: String {
        return (self as NSError).domain
    }
    
    var isRequestException: Bool {
        return (self is RxApolloError)
    }
    
    private func handleException(_ error: Error) -> String {
        switch error {
        case RxApolloError.graphQLError(let description):
            return description
        default:
            return error.localizedDescription
        }
    }
}
