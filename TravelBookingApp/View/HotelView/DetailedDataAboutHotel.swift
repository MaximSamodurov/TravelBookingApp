//
//  DetailedDataAboutHotel.swift
//  TravelBookingApp
//
//  Created by Fixed on 04.02.24.
//

import UIKit

class DetailedDataAboutHotel: UICollectionViewCell {
        
        lazy var aboutHotelStackView = UIStackView(arrangedSubviews: [aboutHotelLabel, UIView()])
    
        lazy var peculiaritiesStackView1 = UIStackView(arrangedSubviews: [peculiarities1, peculiarities2])
        lazy var peculiaritiesStackView2 = UIStackView(arrangedSubviews: [peculiarities3, peculiarities4])

        lazy var peculiaritiesVerticalStackViewOverall = VerticalStackView(arrangedSubViews: [peculiaritiesStackView1, peculiaritiesStackView2])
    
        lazy var aboutHotelLabel: UILabel = {
            let label = UILabel()
            label.text = "Об отеле"
            label.font = UIFont.boldSystemFont(ofSize: 22)
            return label
        }()

        lazy var peculiarities1: UILabel = {
            let label = UILabel()
            label.text = "Бесплатный Wifi на всей территории отеля" // данные из АПИ
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .systemGray
            label.backgroundColor = UIColor(white: 0.7, alpha: 0.1)
            label.layer.cornerRadius = 5
            label.clipsToBounds = true
            return label
        }()

        lazy var peculiarities2: UILabel = {
            let label = UILabel()
            label.text = "1 км до пляжа" // данные из АПИ
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .systemGray
            label.backgroundColor = UIColor(white: 0.7, alpha: 0.1)
            label.layer.cornerRadius = 5
            label.clipsToBounds = true
            return label
        }()

        lazy var peculiarities3: UILabel = {
            let label = UILabel()
            label.text = "Бесплатный фитнес-клуб" // данные из АПИ
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .systemGray
            label.backgroundColor = UIColor(white: 0.7, alpha: 0.1)
            label.layer.cornerRadius = 5
            label.clipsToBounds = true
            return label
        }()

        lazy var peculiarities4: UILabel = {
            let label = UILabel()
            label.text = "20 км до аэропорта" // данные из АПИ
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .systemGray
            label.backgroundColor = UIColor(white: 0.7, alpha: 0.1)
            label.layer.cornerRadius = 5
            label.clipsToBounds = true
            return label
        }()
        
        lazy var descriptionAboutHotel: UILabel = {
            let label = UILabel()
            label.text = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!" //данные из апи
            label.font = UIFont.systemFont(ofSize: 16)
            label.numberOfLines = 0
            return label
        }()
    
    lazy var buttonsVerticalStack = VerticalStackView(arrangedSubViews: [CustomButton(frame: CGRect(x: 0, y: 0, width: 370, height: 150), highLabelTitle: "Удобства", lowLabelTitle: "Самое необходимое", sfSymbolString: "star.fill"),
                                                                         CustomButton(frame: CGRect(x: 0, y: 0, width: 370, height: 150), highLabelTitle: "Что включено", lowLabelTitle: "Самое необходимое", sfSymbolString: "star.fill"),
                                                                         CustomButton(frame: CGRect(x: 0, y: 0, width: 370, height: 150), highLabelTitle: "Что не включено", lowLabelTitle: "Самое необходимое", sfSymbolString: "star.fill")])

    lazy var choiceRoom: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("К выбору номера", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1830555499, green: 0.4307632148, blue: 0.9687146544, alpha: 1)
        button.tintColor = .white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.cornerRadius = 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//
//        aboutHotelStackView.spacing = 15
//        aboutHotelStackView.distribution = .fillEqually
        
        peculiaritiesVerticalStackViewOverall.spacing = 15
        peculiaritiesVerticalStackViewOverall.distribution = .fillEqually
        peculiaritiesStackView1.spacing = 15
        peculiaritiesStackView2.spacing = 15
        
        buttonsVerticalStack.distribution = .fillEqually
        buttonsVerticalStack.spacing = 15
        
        let mainDetailedDataAboutHotel = VerticalStackView(arrangedSubViews: [aboutHotelStackView,
                                                                              peculiaritiesVerticalStackViewOverall,
                                                                              descriptionAboutHotel,
                                                                              buttonsVerticalStack,
                                                                              choiceRoom])
        mainDetailedDataAboutHotel.spacing = 15
        self.contentView.addSubview(mainDetailedDataAboutHotel)
        mainDetailedDataAboutHotel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainDetailedDataAboutHotel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainDetailedDataAboutHotel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainDetailedDataAboutHotel.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainDetailedDataAboutHotel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainDetailedDataAboutHotel.widthAnchor.constraint(equalToConstant: 370),
            
            
            aboutHotelStackView.topAnchor.constraint(equalTo: mainDetailedDataAboutHotel.topAnchor),
            aboutHotelStackView.heightAnchor.constraint(equalToConstant: 30),
            
            peculiaritiesVerticalStackViewOverall.topAnchor.constraint(equalTo: aboutHotelStackView.bottomAnchor, constant: 20),
            peculiaritiesVerticalStackViewOverall.heightAnchor.constraint(equalToConstant: 80),
            
            descriptionAboutHotel.topAnchor.constraint(equalTo: peculiaritiesVerticalStackViewOverall.bottomAnchor, constant: 20),
            descriptionAboutHotel.heightAnchor.constraint(equalToConstant: 100),
            
            buttonsVerticalStack.topAnchor.constraint(equalTo: descriptionAboutHotel.bottomAnchor, constant: 20),
            buttonsVerticalStack.widthAnchor.constraint(equalToConstant: 370),
            buttonsVerticalStack.heightAnchor.constraint(equalToConstant: 200),

            choiceRoom.topAnchor.constraint(equalTo: buttonsVerticalStack.bottomAnchor, constant: 20),
            choiceRoom.heightAnchor.constraint(equalToConstant: 50),
            choiceRoom.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
