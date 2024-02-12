//
//  EndPoint.swift
//  TravelBookingApp
//
//  Created by Fixed on 07.02.24.
//

import Foundation

struct EndPoint {
    var path: String
}

extension EndPoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "run.mocky.io"
        components.path = "/v3/" + path
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components \(components)")
        }
        return url
    }
}

extension EndPoint {
    static var hotel: Self {
        EndPoint(path: "75000507-da9a-43f8-a618-df698ea7176d")
    }
}
