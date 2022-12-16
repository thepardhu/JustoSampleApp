//
//  RxSwift+Extension.swift
//  JustoSampleApp
//
//  Created by Juan Ticante on 16/12/22.
//

import Foundation
import RxSwift

extension PrimitiveSequence where Trait == CompletableTrait, Element == Swift.Never {
    static func from(callable: @escaping () throws -> Void) -> Completable {
        return Completable.create { observer in
            do {
                try callable()
                observer(CompletableEvent.completed)
            } catch {
                observer(CompletableEvent.error(error))
            }
            return Disposables.create()
        }
    }
}

extension ObservableType {
    
    func flatMap<A: AnyObject, O: ObservableType>(weak obj: A, selector: @escaping (A, Self.Element) throws -> O) -> Observable<O.Element> {
        return flatMap { [weak obj] value -> Observable<O.Element> in
            try obj.map { try selector($0, value).asObservable() } ?? Observable.error(RxError.unknown)
        }
    }
    
    func retryTimes(_ maxAttemptCount: Int = .one, when: @escaping (Error) -> Observable<Void>) -> Observable<Element> {
        return retry { errorObservable -> Observable<Void> in
            var retries = maxAttemptCount
            return errorObservable.flatMap { error -> Observable<Void> in
                guard retries > .zero else { return Observable.error(error) }
                retries -= .one
                return when(error)
            }
        }
    }
    
    public func completable() -> Completable {
        ignoreElements().asCompletable()
    }
}
