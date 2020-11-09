//
//  TestService.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/09.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation

struct LabelService: Requestable {
    typealias NetworkData = [Label]
    static let shared = LabelService()
    
    func getLables(completion: @escaping ([Label]) -> Void) {
        get("http://49.50.160.103:3000/labels") { result in
            switch result {
            case .networkSuccess(let data):
                completion(data.resResult)
            case .networkError(let error):
                print(error)
            case .networkFail:
                print("Network Fail!!!!")
            }
        }
    }
    
}
