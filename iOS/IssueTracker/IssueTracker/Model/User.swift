//
//  User.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/10.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation

struct User: Codable, Hashable {
    let id: Int?
    let nickname: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "user_id"
        case nickname
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(nickname)
    }
}
