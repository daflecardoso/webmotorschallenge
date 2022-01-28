//
//  HomeViewModel.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel: BaseViewModel {
    
    private let vehicleService: VehicleServiceContract
    
    init(vehicleService: VehicleServiceContract) {
        self.vehicleService = vehicleService
    }
    
    private(set) var items: [Vehicle] = []
    
    private let _reload = PublishSubject<()>()
    var reload: Driver<()> { _reload.asDriver(onErrorJustReturn: ()) }
    
    func fetch() {
        vehicleService
            .vehicles(page: 1)
            .loading(isLoading)
            .subscribe(onSuccess: { [unowned self] vehicles in
                self.items = vehicles
                self._reload.onNext(())
            }, onFailure: handleError(error:))
            .disposed(by: disposeBag)
    }
}
