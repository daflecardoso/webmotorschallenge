//
//  VehicleDetailViewModel.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation

class VehicleDetailViewModel: BaseViewModel {
    
    internal let vehicle: Vehicle
    private(set) var items: [VehicleDetailCellType] = []
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
    
    func fetch() {
        self.items = [
            makePhotos(),
            makeVehicle(),
            makePrice(),
            makeDetails()
        ].flatMap { $0 }
    }
    
    private func makePhotos() -> [VehicleDetailCellType] {
        return [
            .photos(vehicle.imageUrl)
        ]
    }
    
    private func makeVehicle() -> [VehicleDetailCellType] {
        return [
            .vehicle(vehicle)
        ]
    }
    
    private func makePrice() -> [VehicleDetailCellType] {
        return [
            .price(vehicle.priceFormatted)
        ]
    }
    
    private func makeDetails() -> [VehicleDetailCellType] {
        return [
            .detail(vehicle)
        ]
    }
}
