//
//  MainInfoObjects.swift
//  TravelBookingApp
//
//  Created by Fixed on 02.02.24.
//

import UIKit

class MainInfoObjects {
    
    lazy var starPic: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "star.fill")
        iv.tintColor = #colorLiteral(red: 0.9727799296, green: 0.6572374105, blue: 0.01753924601, alpha: 1)
        return iv
    }()
    
    lazy var starNumber: UILabel = {
        let label = UILabel()
        label.text = "5" // Сюда данные из АПИ
        label.textColor = #colorLiteral(red: 0.9727799296, green: 0.6572374105, blue: 0.01753924601, alpha: 1)
        return label
    }()
    
    lazy var starInWords: UILabel = {
        let label = UILabel()
        label.text = "Превосходно" // Сюда данные из АПИ
        label.textColor = #colorLiteral(red: 0.9727799296, green: 0.6572374105, blue: 0.01753924601, alpha: 1)
        return label
    }()
    
    lazy var adressLabel: UILabel = {
        let label = UILabel()
        label.text = "Лучший пятизвездочный отель в Хургаде, Египет" // Сюда данные из АПИ
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        return label
    }()
    
    lazy var adressButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitle("Madinat Makadi, Safaga Road, Makadi Bay, Египет", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.1830555499, green: 0.4307632148, blue: 0.9687146544, alpha: 1), for: .normal)
        button.contentHorizontalAlignment = .left
        button.fillSuperview()
        return button
    }()
    
    lazy var price: UILabel = {
        let label = UILabel()
        label.text = "от \(136673)" // Сюда данные из АПИ
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    lazy var priceIncluded: UILabel = {
        let label = UILabel()
        label.text = "За тур с перелётом" // Сюда данные из АПИ
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()

}
