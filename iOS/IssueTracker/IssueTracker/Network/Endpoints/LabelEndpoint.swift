//
//  APIEndpoints.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/09.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation
import Alamofire

enum LabelEndpoint {
    case get
    case create(name: String, description: String, color: String)
    case update(id: Int, name: String, description: String, color: String)
    case delete(id: Int)
}

extension LabelEndpoint: EndpointType {
    
    var path: String {
        let basePath = baseUrl + "/labels"
        
        switch self {
        case .get, .create:
            return basePath
        case .update(let id, _, _, _):
            return basePath + "/\(id)"
        case .delete(let id):
            return basePath + "/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .create:
            return .post
        case .update:
            return .put
        case .delete:
            return .delete
        }
    }
    
    var params: [String: Any]? {
        switch self {
        case .get, .delete:
            return nil
        case .create(let name, let description, let color),
             .update(_, let name, let description, let color):
            return ["name": name,
                    "description": description,
                    "color": color]
        }
    }
    
}
