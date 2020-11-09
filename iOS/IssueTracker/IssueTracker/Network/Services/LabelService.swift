//
//  LabelService.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/09.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation

struct LabelService: Requestable {
    
    typealias NetworkData = ResponseArray<Label>
    static let shared = LabelService()
    let endpoint = APIEndpoints.label
    
    func getLables(completion: @escaping ([Label]) -> Void) {
        request(endpoint.url,
                method: .get,
                params: nil) { result in
                    
                    switch result {
                    case .networkSuccess(let data):
                        guard let labels = data.resResult.data else { return }
                        completion(labels)
                    case .networkError(let error):
                        print(error)
                    case .networkFail:
                        print("Network Fail!!!!")
                    }
        }
    }
    
    func postLabel(name: String,
                   description: String,
                   color: String,
                   completion: @escaping () -> Void) {
        
        let body: [String: Any] = [
            "name": name,
            "description": description,
            "color": color
        ]
        request(endpoint.url,
                method: .post,
                params: body) { result in
                    
                    switch result {
                    case .networkSuccess( _):
                        completion()
                    case .networkError(let error):
                        print(error)
                    case .networkFail:
                        print("Network Fail!!!!")
                    }
        }
    }
    
    func putLabel(id: Int,
                  name: String,
                  description: String,
                  color: String,
                  completion: @escaping () -> Void) {
        
        let body: [String: Any] = [
            "id": id,
            "name": name,
            "description": description,
            "color": color
        ]
        
        request(endpoint.url + "/\(id)",
                method: .put,
                params: body) { result in
                    
                    switch result {
                    case .networkSuccess( _):
                        completion()
                    case .networkError(let error):
                        print(error)
                    case .networkFail:
                        print("Network Fail!!!!")
                    }
        }
    }
    
}
