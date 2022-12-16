//
//  Category.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 15/12/22.
//

import Foundation

struct Category {
    var id: String
    var name: String
    var backgroundImage: String
    var subcategories: [Category]
    
    init(id: String = .empty,
         name: String = .empty,
         backgroundImage: String = .empty,
         subcategories: [Category] = []) {
        self.id = id
        self.name = name
        self.backgroundImage = backgroundImage
        self.subcategories = subcategories
    }
}
