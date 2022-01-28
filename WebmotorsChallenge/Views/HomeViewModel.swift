//
//  HomeViewModel.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
    private let vehicleService = VehicleService()
    
    func fetch() {
        vehicleService
            .vehicles(page: 1)
            .loading(isLoading)
            .subscribe(onSuccess: { [unowned self] vehicles in
                
            }, onFailure: handleError(error:))
            .disposed(by: disposeBag)
    }
}
