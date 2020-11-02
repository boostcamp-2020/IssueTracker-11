//
//  Milestone.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import Foundation

struct Milestone {
    var title: String
    var dueDate: String?
    var description: String
    var openNumber: Int
    var closedNumber: Int
    
    var progressPercentage: Int {
        return openNumber == 0 ? 0 : Int(closedNumber / openNumber)
    }
}
