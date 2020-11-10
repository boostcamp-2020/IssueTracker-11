//
//  NSNotification.Name+.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/10.
//  Copyright © 2020 김근수. All rights reserved.
//

import Foundation

extension NSNotification.Name {
    
    // MARK: - Milestone
    
    public static let milestoneDidCreate = Notification.Name("MilestoneDidCreate")
    public static let milestoneDidDelete = Notification.Name("MilestoneDidDelete")
    public static let milestoneDidUpdate = Notification.Name("milestoneDidUpdate")
    
}
