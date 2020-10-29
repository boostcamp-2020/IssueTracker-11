//
//  CreationFormType.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/10/30.
//  Copyright © 2020 김근수. All rights reserved.
//

import Foundation

enum CreationFormType {
    case label
    case milestone
}

extension CreationFormType {
    
    var formTitles: [String] {
        switch self {
        case .label:
            return ["제목", "설명", "색상"]
        case .milestone:
            return ["제목", "완료날짜", "설명"]
        }
    }
    
}
