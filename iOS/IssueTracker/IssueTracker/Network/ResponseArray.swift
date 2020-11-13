//
//  ResponseArray.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/09.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation
import Alamofire

struct ResponseArray<T: Codable>: Codable {
    var status: String?
    var data: [T]?
}
