//
//  ViewController.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 13/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    
    func fetchData(){
        let collectionsFilter = CollectionFilterInput(published: CollectionPublished.published, isHidden: false)
        Network.shared.apollo.fetch(query: FetchCollectionsQuery(first: Constants.collectionSize, productFirst: Constants.pageProductSize, filter: collectionsFilter, postalCode: "72730")) { result in
          switch result {
          case .success(let graphQLResult):
            print("Success! Result: \(graphQLResult)")
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
    
    private enum Constants {
        static let collectionSize = 10
        static let pageProductSize = 10
        static let pageSize = 30
    }
}

