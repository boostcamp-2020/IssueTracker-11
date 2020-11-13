//
//  MilestoneService.swift
//  IssueTracker
//
//  Created by 김근수 on 2020/11/10.
//  Copyright © 2020 김근수. All rights reserved.
//

import Foundation

class MilestoneService: Requestable {
    typealias NetworkData = ResponseArray<Milestone>
    
    static let shared = MilestoneService()
    private init() {}
    
    var milestoneEndpoint: MilestoneEndpoint = .get
    
    func getAll(completion: @escaping ([Milestone]) -> Void) {
        milestoneEndpoint = .get
        request(milestoneEndpoint) { result in
            switch result {
            case .networkSuccess(let data):
                guard let milestones = data.resResult.data else { return }
                completion(milestones)
            case .networkError(let error):
                print(error)
            case .networkFail:
                print("Network Fail!!!!")
            }
        }
    }
    
    func create(milestone: Milestone, completion: @escaping () -> Void) {
        guard
            let title = milestone.title,
            let description = milestone.description
            else { return }
        
        milestoneEndpoint = .create(title: title,
                                    dueDate: milestone.dueDate,
                                    description: description)
        
        request(milestoneEndpoint) { result in
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
    
    func update(milestone: Milestone, completion: @escaping () -> Void) {
        guard
            let id = milestone.id,
            let title = milestone.title,
            let description = milestone.description
            else { return }
        
        milestoneEndpoint = .update(id: id,
                                    title: title,
                                    dueDate: milestone.dueDate,
                                    description: description)
        
        request(milestoneEndpoint) { result in
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
    
    func delete(id: Int, completion: @escaping () -> Void) {
        milestoneEndpoint = .delete(id: id)
        request(milestoneEndpoint) { result in
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
