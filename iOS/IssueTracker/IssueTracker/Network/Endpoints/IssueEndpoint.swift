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
    case create(title: String,
                contents: String?,
                author: Int,
                milestoneID: Int?,
                assignees: [User],
                labels: [Label])
}

extension IssueEndpoint: EndpointType {
    
    var path: String {
        let basePath = baseUrl + "/issues"
        
        switch self {
        case .get:
            return basePath
        case .create:
            return basePath
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .create:
            return .post
        }
    }
    
    var params: [String: Any]? {
        switch self {
        case .get:
            return nil
        case .create(let title, let contents, let author, let milestoneID, let assignees, let label):
            var param = ["title": title,
                         "author": author,
                         "assignees": assignees,
                         "label": label] as [String: Any]
            if milestoneID != nil { param["milestone"] = milestoneID }
            if contents != nil { param["contents"] = contents }
            return param
        }
    }
    
}
