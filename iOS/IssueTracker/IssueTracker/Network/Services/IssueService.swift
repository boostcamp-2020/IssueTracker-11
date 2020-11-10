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
    
    func create(issue: Issue, completion: @escaping () -> Void) {
        guard
            let title = issue.title,
            let author = issue.authorID,
            let assignees = issue.assignees,
            let labels = issue.labels
            else { return }
        
        issueEndpoint = .create(title: title,
                                contents: issue.contents,
                                author: author,
                                milestoneID: issue.milestoneID,
                                assignees: assignees,
                                labels: labels)
        
        request(issueEndpoint) { result in
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
    
    func deleteIssue(id: Int, completion: @escaping () -> Void) {
        issueEndpoint = .delete(id: id)
        
        request(issueEndpoint) { result in
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
