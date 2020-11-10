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
    let assignees: [User]?
    let labels: [Label]?
    let milestone: Milestone?

    enum CodingKeys: String, CodingKey {
        case title, contents, status, author, labels, assignees, milestone
        case id = "issue_id"
    }
}

extension Issue: Hashable {
    
    static func == (lhs: Issue, rhs: Issue) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
        hasher.combine(contents)
        hasher.combine(status)
        hasher.combine(labels)
        hasher.combine(author)
        hasher.combine(assignees)
        hasher.combine(milestone)
    }
    
}
