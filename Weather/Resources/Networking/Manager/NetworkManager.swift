//
//  NetworkManager.swift
//  Weather
//
//  Created by Thành Đỗ Long on 05/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import Alamofire
import PromiseKit

protocol Network: class {
    func responseDecodable<T: Decodable>(route: Route, decoder: JSONDecoder) -> Promise<T>
}

extension Network {
    func responseDecodable<T: Decodable>(route: Route) -> Promise<T> {
        return responseDecodable(route: route, decoder: JSONDecoder())
    }
}


final class NetworkManager: Network {
    func responseDecodable<T>(route: Route, decoder: JSONDecoder) -> Promise<T> where T : Decodable {
        return performResponseDecodable(route: route, decoder: decoder)
    }

    @discardableResult
    private func performResponseDecodable<T: Decodable>(route: Route, decoder: JSONDecoder = JSONDecoder()) -> Promise<T> {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        let result = Promise<T> { seal in

            AF.request(route).validate().responseDecodable(of: T.self,
                                                           decoder: decoder,
                                                           completionHandler: { (response) in
                                                            
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
                switch response.result {
                case .success(let success):
                    seal.fulfill(success)
                case .failure(let error):
                    seal.reject(error)
                }
            })
        }

        return result
    }
    
}
