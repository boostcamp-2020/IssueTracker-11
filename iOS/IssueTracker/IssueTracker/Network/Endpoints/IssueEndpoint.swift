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
    case delete(id: Int)
    case closeIssue(ids: [Int])
}

extension IssueEndpoint: EndpointType {
    
    var path: String {
        let basePath = baseUrl + "/issues"
        
        switch self {
        case .get:
            return basePath
        case .create:
            return basePath
        case .delete(let id):
            return basePath + "/\(id)"
        case .closeIssue:
            return basePath + "/status"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .create:
            return .post
        case .delete:
            return .delete
        case .closeIssue:
            return .patch
        }
    }
    
    var params: [String: Any]? {
        switch self {
        case .get, .delete:
            return nil
        case .create(let title, let contents, let author, let milestoneID, let assignees, let label):
            var param = ["title": title,
                         "author": author,
                         "assignees": assignees,
                         "label": label] as [String: Any]
            if milestoneID != nil { param["milestone"] = milestoneID }
            if contents != nil { param["contents"] = contents }
            return param
        case .closeIssue(let ids):
            return ["ids": ids]
        }
    }
    
}
