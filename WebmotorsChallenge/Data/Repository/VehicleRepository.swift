//
//  VehiclesRepository.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 31/01/22.
//

import Foundation
import RxSwift
import RxCocoa
import CoreData

protocol VehicleRepositoryContract {
    func vehicles(page: Int) -> Single<[Vehicle]>
}

class VehicleRepository: VehicleRepositoryContract {
    
    private let service: VehicleServiceContract
    private let context: NSManagedObjectContext
    private let disposeBag = DisposeBag()
    
    init(service: VehicleServiceContract, context: NSManagedObjectContext) {
        self.service = service
        self.context = context
    }
    
    func vehicles(page: Int) -> Single<[Vehicle]> {
        return service.vehicles(page: page)
    }
    
    private func local() -> [Vehicle] {
        do {
            let fetchRequest: NSFetchRequest<Vehicles> = Vehicles.fetchRequest()
            let objects = try context.fetch(fetchRequest)
            let vehicles = objects.map {
                Vehicle(
                    id: Int($0.id),
                    make: $0.make,
                    model: $0.model,
                    version: $0.version,
                    image: $0.image,
                    km: Int($0.km),
                    price: $0.price,
                    yearModel: Int($0.yearModel),
                    yearFab: Int($0.yearFab),
                    color: $0.color
                )
            }
            return vehicles
        } catch {
            return []
        }
    }
    
    private func save(items: [Vehicle]) {
        items.forEach {
            let vehicle = Vehicles.init(context: context)
            vehicle.id = Int32($0.id)
            vehicle.make = $0.make
            vehicle.model = $0.model
            vehicle.version = $0.version
            vehicle.image = $0.image
            vehicle.km = Int32($0.km)
            vehicle.price = $0.price
            vehicle.yearModel = Int32($0.yearModel)
            vehicle.yearFab = Int32($0.yearFab)
            vehicle.color = $0.color
        }
        do {
            try context.save()
            print("🟢 saved")
        } catch {
            print("Unable to Save Vehicle, \(error)")
        }
    }
    
    private func delete() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Vehicles")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        do {
            try context.execute(deleteRequest)
            print("🟢 deleted")
        } catch {
            print("Unable to Delete Vehicles, \(error)")
        }
    }
}
