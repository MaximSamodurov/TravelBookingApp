//
//  NetworkDataFetch.swift
//  TravelBookingApp
//
//  Created by Fixed on 07.02.24.
//

import Foundation

class NetworkDataFetch {
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchHotel(responce: @escaping (HotelModel?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData { result in
            switch result {
            case .success(let data):
                do {
                    let hotel = try JSONDecoder().decode(HotelModel.self, from: data)
                    responce(hotel, nil)
                } catch let jsonError {
                    print("Failed To Decode JSON", jsonError)
                }
            case .failure(_):
                responce(nil, .canNotParseData)
            }
        }
    }
    
}
