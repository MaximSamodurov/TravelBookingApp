//
//  DetailedDataObjects.swift
//  TravelBookingApp
//
//  Created by Fixed on 07.02.24.
//

import UIKit

class DetailedDataObjects {
    
    lazy var aboutHotelLabel: UILabel = {
        let label = UILabel()
        label.text = "Об отеле"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()

    lazy var peculiarities1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray
        label.backgroundColor = UIColor(white: 0.7, alpha: 0.1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()

    lazy var peculiarities2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray
        label.backgroundColor = UIColor(white: 0.7, alpha: 0.1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()

    lazy var peculiarities3: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray
        label.backgroundColor = UIColor(white: 0.7, alpha: 0.1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()

    lazy var peculiarities4: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .systemGray
        label.backgroundColor = UIColor(white: 0.7, alpha: 0.1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    lazy var descriptionAboutHotel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
}
