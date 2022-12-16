//
//  ViewController.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 13/12/22.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
  
  private let disposeBag = DisposeBag()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData(){
      let collection = CollectionsRemoteDataSource(apolloClientBuilder: ApolloClientBuilder())
     collection.fetchCollections(zipCode: "72730")
        .do(onNext: { [weak self] dataCollection in
            guard let self = self else { return }
          dataCollection.map { itemCollection in
            if !itemCollection.productInfo.products.isEmpty {
              print(itemCollection.productInfo.products)
            }
          }
        })
        .observe(on: MainScheduler.instance)
        .subscribe(onNext: { [weak self] itemCollection in
            
        }, onError: { [weak self] error in
            
        }).disposed(by: disposeBag)

      
    }
}

