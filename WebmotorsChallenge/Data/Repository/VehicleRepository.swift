//
//  VehiclesRepository.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 31/01/22.
//

import Foundation
import RxSwift
import RxCocoa

protocol VehicleRepositoryContract {
    func vehicles(page: Int) -> Single<[Vehicle]>
}

class VehicleRepository: VehicleRepositoryContract {
    
    private let service: VehicleServiceContract
    
    init(service: VehicleServiceContract) {
        self.service = service
    }
    
    func vehicles(page: Int) -> Single<[Vehicle]> {
        return service.vehicles(page: page)
    }
}
