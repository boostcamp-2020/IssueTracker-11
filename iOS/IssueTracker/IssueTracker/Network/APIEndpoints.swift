//
//  APIManager.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/09.
//  Copyright © 2020 양어진. All rights reserved.
//

protocol APIManager { }

extension APIManager {
    
    static func url(_ path: String) -> String {
        return "http://49.50.160.103:3000" + path
    }
    
}

enum Endpoint {
    case label
//    case article(id: Article.ID)
//    case search(query: String, maxResultCount: Int = 100)
}

extension Endpoint {
    var url: String {
        switch self {
        case .label:
            return .makeForEndpoint("/labels")
//        case .article(let id):
//            return .makeForEndpoint("articles/\(id)")
//        case .search(let query, let count):
//            return .makeForEndpoint("search/\(query)?count=\(count)")
        }
    }
}

private extension String {
    static func makeForEndpoint(_ endpoint: String) -> String {
        return  "http://49.50.160.103:3000\(endpoint)"
    }
}
