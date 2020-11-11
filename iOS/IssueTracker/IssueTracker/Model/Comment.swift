//
//  Comment.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/11.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation

struct Comment: Codable {
    let id: Int?
    let contents: String?
    let issueID: Int?
    let authorID: Int?
    let createdAt: String?
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case contents
        case id = "comment_id"
        case authorID = "author"
        case issueID = "issue_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

extension Comment: Hashable {
    
    static func == (lhs: Comment, rhs: Comment) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(contents)
    }
    
}
