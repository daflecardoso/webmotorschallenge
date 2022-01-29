//
//  Vehicle.swift
//  WebmotorsChallenge
//
//  Created by Dafle on 28/01/22.
//

import Foundation

struct Vehicle: Decodable {
    let id: Int
    let make: String
    let model: String
    let version: String
    let image: String
    let km: Int
    let price: String
    let yearModel: Int
    let yearFab: Int
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case make = "Make"
        case model = "Model"
        case version = "Version"
        case image = "Image"
        case km = "KM"
        case price = "Price"
        case yearModel = "YearModel"
        case yearFab = "YearFab"
        case color = "Color"
    }
    
    var imageUrl: String { image.replacingOccurrences(of: "http://", with: "https://") }
    
    var priceFormatted: String { Int(price.digits)?.toDecimalCoin() ?? "-" }
    
    var yearFormatted: String { "\(yearFab)/\(yearModel)" }
    
    var kmFormatted: String { "\(km.toNumber()) km" }
}
