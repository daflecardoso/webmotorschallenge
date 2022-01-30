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
    private var isDataLoading: Bool = false
    private var pageNumber: Int = 0
    private var paginationFinished: Bool = false
    
    func paginate(offsetY: CGFloat, contentSizeHeight: CGFloat) {
        if (offsetY > contentSizeHeight) && !isDataLoading && !paginationFinished {
            fetch()
        }
    }
    
    func refresh() {
        guard !isDataLoading else { return }
        pageNumber = 0
        paginationFinished = false
        shouldRemoveAll = true
        fetch()
    }
    
    func fetch() {
        self.isDataLoading = true
        self.pageNumber = (self.pageNumber + 1)
        
        vehicleService
            .vehicles(page: pageNumber)
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
