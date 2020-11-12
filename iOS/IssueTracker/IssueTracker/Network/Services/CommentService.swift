//
//  CommentService.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/12.
//  Copyright © 2020 김근수. All rights reserved.
//

import Foundation

class CommentService: Requestable {
    
    typealias NetworkData = ResponseObject<Comment>
    static let shared = CommentService()
    private init() {}
    
    func commentCreate(comment: Comment,
                       completion: @escaping () -> Void) {
        
        guard let contents = comment.contents,
            let authorID = SceneDelegate.user?.id,
            let issueID = comment.issueID
        else { return }
        
        let issueDetailEndpoint: IssueDetailEndpoint = .commentPost(contents: contents,
                                                                    author: 2,
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
