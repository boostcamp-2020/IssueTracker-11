//
//  EndpointType.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/10.
//  Copyright © 2020 김근수. All rights reserved.
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
