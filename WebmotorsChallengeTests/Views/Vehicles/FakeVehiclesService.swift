//
//  FakeVehiclesService.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 30/01/22.
//

import XCTest
import RxSwift
import RxCocoa
@testable import WebmotorsChallenge

class FakeVehiclesService: VehicleServiceContract {
    
    enum RequestType {
        case success, error, empty
    }
    
    private let type: RequestType
    
    init(type: RequestType) {
        self.type = type
    }
    
    func vehicles(page: Int) -> Single<[Vehicle]> {
        let vehicle = Vehicle.fakeInstance
        switch type {
        case .success:
            return Single.just([Vehicle](repeating: vehicle, count: 10))
        case .error:
            return Single.error(ServiceError.noInternetConnection)
        case .empty:
            return Single.just([])
        }
    }
}
