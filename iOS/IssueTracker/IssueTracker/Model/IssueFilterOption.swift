//
//  FilterOptions.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/04.
//  Copyright © 2020 김근수. All rights reserved.
//

import Foundation

protocol FilterOption {
    var description: String { get }
}

enum PlainFilterOption: CaseIterable {
    case open
    case created
    case assigned
    case commented
    case closed
}

extension PlainFilterOption: FilterOption {
    
    var description: String {
        switch self {
        case .open:
            return "열린 이슈들"
        case .created:
            return "내가 작성한 이슈들"
        case .assigned:
            return "나한테 할당된 이슈들"
        case .commented:
            return "내가 댓글을 남긴 이슈들"
        case .closed:
            return "닫힌 이슈들"
        }
    }
    
}

enum DetailFilterOption: CaseIterable {
    case creator
    case label
    case milestone
    case assignee
    
    public static let sectionTitle = "세부 조건"
}

extension DetailFilterOption: FilterOption {
    
    var description: String {
        switch self {
        case .creator:
            return "작성자"
        case .label:
            return "레이블"
        case .milestone:
            return "마일스톤"
        case .assignee:
            return "담당자"
        }
    }
}
