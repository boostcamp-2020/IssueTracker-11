//
//  APIEndpoints.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/09.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation
import Alamofire

protocol EndpointType {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var params: [String : Any]? { get }
}

extension EndpointType {
    
    var baseUrl: String {
        return "http://49.50.160.103:3000"
    }
    
}

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
    
    var params: [String : Any]? {
        switch self {
        case .get, .delete(_):
            return nil
        case .create(let name, let description, let color),
             .update(_, let name, let description, let color):
            return ["name": name,
                    "description": description,
                    "color": color]
        }
    }
    
}
enum APIEndpoints {
    case label
}

extension APIEndpoints {
    var url: String {
        switch self {
        case .label:
            return .makeForEndpoint("/labels")
        }
    }
}

private extension String {
    
    static func makeForEndpoint(_ endpoint: String) -> String {
        return  "http://49.50.160.103:3000\(endpoint)"
    }
    
}
