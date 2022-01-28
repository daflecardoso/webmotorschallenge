//
//  AuthService.swift
//  VogChallenge
//
//  Created by Dafle on 24/11/21.
//

import Foundation
import RxSwift

protocol VehicleServiceContract {
    func vehicles(page: Int) -> Single<[Vehicle]>
}

class VehicleService: VehicleServiceContract {
 
    private let provider = ApiProvider<VehiclesAPI>()
    
    func vehicles(page: Int) -> Single<[Vehicle]> {
        return provider.rx.request(.vehicles(page)).map([Vehicle].self)
    }
}
