//
//  VehiclesViewModel.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation
import RxSwift
import RxCocoa

class VehiclesViewModel: BaseViewModel {
    
    private let vehicleService: VehicleServiceContract
    
    init(vehicleService: VehicleServiceContract) {
        self.vehicleService = vehicleService
    }
    
    private(set) var items: [Vehicle] = []
    
    private let _reload = PublishSubject<()>()
    var reload: Driver<()> { _reload.asDriver(onErrorJustReturn: ()) }
    
    var shouldRemoveAll = false
    var isDataLoading: Bool = false
    var pageNo: Int = 0
    var paginationFinished: Bool = false
    
    func refresh() {
        guard !isDataLoading else { return }
        pageNo = 0
        paginationFinished = false
        shouldRemoveAll = true
        fetch()
    }
    
    func fetch() {
        self.isDataLoading = true
        self.pageNo = (self.pageNo + 1)
        
        vehicleService
            .vehicles(page: pageNo)
            .paginating(isPaginating)
            .subscribe(onSuccess: { [unowned self] vehicles in
                if shouldRemoveAll { items.removeAll(); shouldRemoveAll = false }
                self.isDataLoading = false
                self.items.append(contentsOf: vehicles)
                self.paginationFinished = vehicles.isEmpty
                self._reload.onNext(())
            }, onFailure: handleError(error:))
            .disposed(by: disposeBag)
    }
}
