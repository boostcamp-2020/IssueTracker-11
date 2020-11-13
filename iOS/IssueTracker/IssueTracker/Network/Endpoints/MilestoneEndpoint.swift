//
//  MilestoneEndpoint.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/10.
//  Copyright © 2020 김근수. All rights reserved.
//

import Foundation
import Alamofire

enum MilestoneEndpoint {
    case get
    case create(title: String, dueDate: String?, description: String)
    case update(id: Int, title: String, dueDate: String?, description: String)
    case changeStatus(id: Int, status: Int)
    case delete(id: Int)
}

extension MilestoneEndpoint: EndpointType {
    
    var path: String {
        let basePath = baseUrl + "/milestones"
        switch self {
        case .get, .create:
            return basePath
        case .update(let id, _, _, _),
             .delete(let id):
            return basePath + "/\(id)"
        case .changeStatus(let id, let status):
            return basePath + "/\(id)\(status)"
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
        case .changeStatus:
            return .patch
        case .delete:
            return .delete
        }
    }
    
    var params: [String: Any]? {
        switch self {
        case .get,
             .changeStatus,
             .delete:
            return nil
        case .create(let title, let dueDate, let description),
             .update(_, let title, let dueDate, let description):
            var param = ["title": title,
                         "description": description]
            if dueDate != nil && !(dueDate?.isEmpty ?? false) {
                param["due_date"] = dueDate
            }
            return param
        }
    }
    
}
