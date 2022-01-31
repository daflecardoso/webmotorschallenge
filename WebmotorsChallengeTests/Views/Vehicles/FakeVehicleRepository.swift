//
//  FakeVehicleRepository.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 31/01/22.
//

import XCTest
import RxSwift
import RxCocoa
@testable import WebmotorsChallenge

class FakeVehiclesRepository: VehicleRepositoryContract {
    
    private let service: VehicleServiceContract
    
    init(service: VehicleServiceContract) {
        self.service = service
    }
    
    func vehicles(page: Int) -> Single<[Vehicle]> {
        return service.vehicles(page: page)
    }
}


