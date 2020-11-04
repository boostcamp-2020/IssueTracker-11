//
//  IssueStatus.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/04.
//  Copyright © 2020 김근수. All rights reserved.
//

import UIKit

enum IssueStatus {
    case open
    case closed
}

extension IssueStatus {
    
    var text: String {
        switch self {
        case .open:
            return "Open"
        case .closed:
            return "Closed"
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .open:
            return UIColor(hex: "3F7C40")
        case .closed:
            return UIColor(hex: "FF5D5D")
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .open:
            return UIColor(hex: "EEF8F0")
        case .closed:
            return UIColor(hex: "FDF0EF")
        }
    }
    
    var image: UIImage? {
        switch self {
        case .open:
            return UIImage(systemName: "exclamationmark.circle")?.withTintColor(self.textColor)
        case .closed:
            return UIImage(systemName: "nosign")?.withTintColor(self.textColor)
        }
    }
    
}
