//
//  LabelTest.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/02.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation

struct Label: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let color: String?

    enum CodingKeys: String, CodingKey {
        case id = "label_id"
        case name, description, color
    }
}

extension Label: Hashable {
    
    static func == (lhs: Label, rhs: Label) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(description)
        hasher.combine(color)
    }
    
}
