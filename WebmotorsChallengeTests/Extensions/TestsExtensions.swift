//
//  TestsExtensions.swift
//  WebmotorsChallengeTests
//
//  Created by Dafle on 30/01/22.
//

import Foundation
import UIKit
@testable import WebmotorsChallenge

extension UITableView {
    
    func toRow(row: Int) {
        selectRow(at: IndexPath(item: row, section: 0), animated: false, scrollPosition: .bottom)
    }
    
    var registeredClasses: [String: Any] {
        let dict = value(forKey: "_cellClassDict") as? [String: Any]
        return dict ?? [:]
    }
}

extension Vehicle {
    
    static var fakeInstance: Vehicle {
        Vehicle(
            id: 1,
            make: "Honda",
            model: "Civic",
            version: "2.0 EXS",
            image: "http://some.com.br",
            km: 10,
            price: "20000,00",
            yearModel: 2020,
            yearFab: 2019,
            color: "Cinza"
        )
    }
}
