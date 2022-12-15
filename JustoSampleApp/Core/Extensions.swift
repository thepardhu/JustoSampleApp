//
//  Extensions.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation
extension String {
    
  static let empty = ""
  
  static func localizeString(for text: String, argument: String = .empty) -> String {
      return String.localizedStringWithFormat(NSLocalizedString(text, comment: .empty), argument)
  }
}
