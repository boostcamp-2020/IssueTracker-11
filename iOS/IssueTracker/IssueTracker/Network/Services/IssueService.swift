//
//  IssueService.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/10.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation

class IssueService: Requestable {
    
    typealias NetworkData = ResponseArray<Issue>
    static let shared = IssueService()
    private init() {}
    
    var issueEndpoint: IssueEndpoint = .get
    
    func getAll(completion: @escaping ([Issue]) -> Void) {
        issueEndpoint = .get
        request(issueEndpoint) { result in
            switch result {
            case .networkSuccess(let data):
                guard let issues = data.resResult.data else { return }
                completion(issues)
            case .networkError(let error):
                print(error)
            case .networkFail:
                print("Network Fail!!!!")
            }
        }
    }
    
}
