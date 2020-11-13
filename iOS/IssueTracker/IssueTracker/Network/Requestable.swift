//
//  Requestable.swift
//  IssueTracker
//
//  Created by 양어진 on 2020/11/09.
//  Copyright © 2020 양어진. All rights reserved.
//

import Alamofire

protocol Requestable {
    associatedtype NetworkData: Codable
    typealias NetworkSuccessResult = (resCode: Int, resResult: NetworkData)
}

extension Requestable {
    
    func request(_ endpoint: EndpointType,
                 completion: @escaping (NetworkResult<NetworkSuccessResult>) -> Void) {
        
        AF.request(endpoint.path,
                   method: endpoint.method,
                   parameters: endpoint.params).responseData { (res) in
                    guard let resCode = res.response?.statusCode else { return }
                    switch res.result {
                    case .success:
                        guard let value = res.value else { return }
                        do {
                            let decoder = JSONDecoder()
                            let datas = try decoder.decode(NetworkData.self, from: value)
                            let result: NetworkSuccessResult = (resCode, datas)
                            completion(.networkSuccess(result))
                        } catch {
                            print("Decoding Err")
                        }
                    case .failure(let err):
                        if (err as NSError?) != nil {
                            completion(.networkFail)
                        } else {
                            completion(.networkError((resCode, err.localizedDescription)))
                        }
                    }
        }
    }
}
