//
//  HotelModel.swift
//  TravelBookingApp
//
//  Created by Fixed on 07.02.24.
//

import Foundation

struct HotelModel: Decodable {
    let name: String
    let adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let aboutTheHotel: AboutTheHotel
    let imageUrls: [String]

    
    enum CodingKeys: String, CodingKey {
        case name, adress
        case minimalPrice = "minimal_price"
        case priceForIt = "price_for_it"
        case rating
        case ratingName = "rating_name"
        case aboutTheHotel = "about_the_hotel"
        case imageUrls = "image_urls"
    }
}

struct AboutTheHotel: Codable {
    let description: String
    let peculiarities: [String]
}
