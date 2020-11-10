//
//  IssueDetailEndpoint.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/10.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation
import Alamofire

// 조회
// 수정
// 댓글추가
// 담당자, 마일스톤, 레이블 추가
enum IssueDetailEndpoint {
    case get
}

extension IssueDetailEndpoint: EndpointType {
    
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
