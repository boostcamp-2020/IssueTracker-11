//
//  APIEndpoints.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/09.
//  Copyright © 2020 양어진. All rights reserved.
//

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
