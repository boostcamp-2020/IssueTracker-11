//
//  IssueDetailService.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/10.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation

class IssueDetailService: Requestable {
    
    typealias NetworkData = Issue
    static let shared = IssueDetailService()
    private init() {}
    
    func get(issueID: Int, completion: @escaping (Issue) -> Void) {
        let issueDetailEndpoint: IssueDetailEndpoint = .get(id: issueID)
        
        request(issueDetailEndpoint) { result in
            switch result {
            case .networkSuccess(let data):
                completion(data.resResult)
            case .networkError(let error):
                print(error)
            case .networkFail:
                print("Network Fail!!!!")
            }
        }
    }
    
    func commentCreate(contents: String, authorID: Int, issueID: Int,
                       completion: @escaping () -> Void) {
        let issueDetailEndpoint: IssueDetailEndpoint = .commentPost(contents: contents,
                                                                    author: authorID,
                                                                    issueID: issueID)
        
        request(issueDetailEndpoint) { result in
            switch result {
            case .networkSuccess:
                completion()
            case .networkError(let error):
                print(error)
            case .networkFail:
                print("Network Fail!!!!")
            }
        }
    }
    
}
