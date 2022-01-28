//
//  BaseViewModel.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel {
    
    internal let disposeBag = DisposeBag()
    private let handleError = HandleError()
    private var alreadyLoaded: Bool = false
    
    private let _onError = PublishSubject<ServiceError>()
    var onError: Driver<ServiceError> {
        return _onError.asDriver(onErrorJustReturn: .none)
    }
    
    var firstLoading: PublishSubject<Bool> {
        if !self.alreadyLoaded {
            alreadyLoaded = true
            return isLoading
        }
        return PublishSubject<Bool>()
    }
    
    internal let isLoading = PublishSubject<Bool>()
    var loading: Driver<Bool> {
        return isLoading.asDriver(onErrorJustReturn: false)
    }
    
    internal let isRequesting = PublishSubject<Bool>()
    var requesting: Driver<Bool> {
        return isRequesting.asDriver(onErrorJustReturn: false)
    }
    
    internal let isPaginating = PublishSubject<Bool>()
    var paginating: Driver<Bool> {
        return isPaginating.asDriver(onErrorJustReturn: false)
    }
    
    func handleError(error: Error) {
        let responseError = handleError.handle(with: error)
        _onError.onNext(responseError)
    }
}

