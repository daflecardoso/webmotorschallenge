//
//  AuthAPI.swift
//  VogChallenge
//
//  Created by Dafle on 24/11/21.
//

import Foundation
import Moya

enum VehiclesAPI {
    case vehicles(Int)
}

extension VehiclesAPI: TargetType {
    
    var baseURL: URL {
        return try! Environment.baseUrl.url()
    }
    
    var path: String {
        switch self {
        case .vehicles:
            return "/api/OnlineChallenge/Vehicles"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .vehicles:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .vehicles(let page):
            return .requestParameters(parameters: ["page": page], encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data {
        switch self {
        case .vehicles:
            return "vehicles_success_response".jsonData
        }
    }
    
    var headers: [String : String]? {
        return ApiProvider<VehiclesAPI>.headers
    }
}
