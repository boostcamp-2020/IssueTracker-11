//
//  IssueEndpoint.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/10.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation
import Alamofire

enum IssueEndpoint {
    case get
}

extension IssueEndpoint: EndpointType {
    
    var path: String {
        let basePath = baseUrl + "/issues"
        
        switch self {
        case .get:
            return basePath
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        }
    }
    
    var params: [String: Any]? {
        switch self {
        case .get:
            return nil
        }
    }
    
}
