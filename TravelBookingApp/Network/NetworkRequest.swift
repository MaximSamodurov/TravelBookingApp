//
//  NetworkRequest.swift
//  TravelBookingApp
//
//  Created by Fixed on 07.02.24.
//

import Foundation

class NetworkRequest {
    static let shared = NetworkRequest()
    
    private init() {}
    
    func getData(completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(.hotel) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    completionHandler(.failure(.urlError))
                } else {
                    guard let data else { return }
                    completionHandler(.success(data))
                }
            }
        }
    }
}
