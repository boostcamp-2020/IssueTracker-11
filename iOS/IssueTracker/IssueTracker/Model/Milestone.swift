//
//  Milestone.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import Foundation

struct Milestone: Codable, Hashable {
    let id: Int?
    let title: String?
    let dueDate: String?
    let description: String?
    let openNumber: Int?
    let closedNumber: Int?
    
    enum CodingKeys: String, CodingKey {
        case title, description
        case id = "milestone_id"
        case dueDate = "due_date"
        case openNumber = "open_number"
        case closedNumber = "closed_number"
    }
    
    var progressPercentage: Int {
        guard
            let openNum = openNumber,
            let closedNum = closedNumber
        else { return 0}
        
        return openNum + closedNum == 0 ? 0 : Int(Float(closedNum) / Float(openNum + closedNum) * 100)
    }
}
