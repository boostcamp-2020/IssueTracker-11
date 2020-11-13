//
//  Issue.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/10.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation

struct Issue: Codable {
    let id: Int?
    let title: String?
    let contents: String?
    let status: Int?
    let author: User?
    let authorID: Int?
    let milestone: Milestone?
    let milestoneID: Int?
    let assignees: [User]?
    let labels: [Label]?
    let comments: [Comment]?
    let createdAt: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case title, contents, status, author, labels, assignees, milestone, authorID, milestoneID, comments
        case id = "issue_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

extension Issue: Hashable {
    
    static func == (lhs: Issue, rhs: Issue) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
            && lhs.contents == rhs.contents
            && lhs.status == rhs.status
            && lhs.author == rhs.author
            && lhs.assignees == rhs.assignees
            && lhs.milestone == rhs.milestone
            && lhs.comments == rhs.comments
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(authorID)
        hasher.combine(title)
        hasher.combine(contents)
        hasher.combine(status)
        hasher.combine(labels)
        hasher.combine(author)
        hasher.combine(assignees)
        hasher.combine(milestone)
        hasher.combine(milestoneID)
        hasher.combine(comments)
    }
    
}
