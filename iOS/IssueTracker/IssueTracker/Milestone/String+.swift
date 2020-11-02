//
//  String+.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/02.
//  Copyright © 2020 김근수. All rights reserved.
//

import Foundation

extension String {
    var isValidDate: Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        return date != nil
    }
}
