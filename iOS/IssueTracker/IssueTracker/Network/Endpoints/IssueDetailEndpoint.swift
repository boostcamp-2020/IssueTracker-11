//
//  IssueDetailEndpoint.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/10.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation
import Alamofire

// 수정
// 댓글추가
// 담당자, 마일스톤, 레이블 추가
enum IssueDetailEndpoint {
    case get(id: Int)
    case commentPost(contents: String, author: Int, issueID: Int)
}

extension IssueDetailEndpoint: EndpointType {
    
    var path: String {
        let basePath = baseUrl + "/issues"
        
        switch self {
        case .get(let id):
            return basePath + "/\(id)"
        case .commentPost(_, _, let id):
            return basePath + "/\(id)/comments"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .commentPost:
            return .post
        }
    }
    
    var params: [String: Any]? {
        switch self {
        case .get:
            return nil
        case .commentPost(let contents, let author, let issueID):
            return ["contents": contents,
                    "author": author,
                    "issue_id": issueID] as [String: Any]
        }
    }
    
}
