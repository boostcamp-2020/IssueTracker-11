//
//  LabelService.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/09.
//  Copyright © 2020 양어진. All rights reserved.
//

import Foundation

class LabelService: Requestable {
    
    typealias NetworkData = ResponseArray<Label>
    static let shared = LabelService()
    private init() {}
    
    var labelEndpoint: LabelEndpoint = .get
    
    func getLables(completion: @escaping ([Label]) -> Void) {
        labelEndpoint = .get
        request(labelEndpoint) { result in
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
    
    func createLabel(label: Label, completion: @escaping () -> Void) {
        guard
            let name = label.name,
            let description = label.description,
            let color = label.color
            else { return }
        
        labelEndpoint = .create(name: name, description: description, color: color)
        request(labelEndpoint) { result in
            switch result {
            case .networkSuccess:
                completion()
            case .networkError(let error):
                print(error)
            case .networkFail:
                print("Network Fail!!!!")
            }
        }
    }
    
    func updateLabel(label: Label, completion: @escaping () -> Void) {
        guard
            let id = label.id,
            let name = label.name,
            let description = label.description,
            let color = label.color
            else { return }
        
        labelEndpoint = .update(id: id, name: name, description: description, color: color)
        request(labelEndpoint) { result in
            switch result {
            case .networkSuccess:
                completion()
            case .networkError(let error):
                print(error)
            case .networkFail:
                print("Network Fail!!!!")
            }
        }
    }
    
    func deleteLabel(id: Int, completion: @escaping () -> Void) {
        labelEndpoint = .delete(id: id)
        request(labelEndpoint) { result in
            switch result {
            case .networkSuccess:
                completion()
            case .networkError(let error):
                print(error)
            case .networkFail:
                print("Network Fail!!!!")
            }
        }
    }
    
}
