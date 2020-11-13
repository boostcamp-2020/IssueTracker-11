//
//  NetworkResult.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/09.
//  Copyright © 2020 양어진. All rights reserved.
//

enum NetworkResult<T> {
    case networkSuccess(T)
    case networkError((resCode: Int, msg: String))
    case networkFail
}
