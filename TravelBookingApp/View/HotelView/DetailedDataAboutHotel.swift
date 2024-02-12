//
//  DetailedDataAboutHotel.swift
//  TravelBookingApp
//
//  Created by Fixed on 04.02.24.
//

import UIKit

class DetailedDataAboutHotel: UICollectionViewCell {
    
    private let mainDataViewModel = MainDataViewModel()

    private func bindViewModel() {
        mainDataViewModel.dataSource.bind { [weak self] _ in
            self?.detailedDataObjects.peculiarities1.text = self?.mainDataViewModel.dataSource.value?.aboutTheHotel.peculiarities[0]
            self?.detailedDataObjects.peculiarities2.text = self?.mainDataViewModel.dataSource.value?.aboutTheHotel.peculiarities[1]
            self?.detailedDataObjects.peculiarities3.text = self?.mainDataViewModel.dataSource.value?.aboutTheHotel.peculiarities[2]
            self?.detailedDataObjects.peculiarities4.text = self?.mainDataViewModel.dataSource.value?.aboutTheHotel.peculiarities[3]
            self?.detailedDataObjects.descriptionAboutHotel.text = self?.mainDataViewModel.dataSource.value?.aboutTheHotel.description
        }
    }
    
    let detailedDataObjects = DetailedDataObjects()
    
    lazy var aboutHotelStackView = UIStackView(arrangedSubviews: [detailedDataObjects.aboutHotelLabel, UIView()])
    lazy var peculiaritiesStackView1 = UIStackView(arrangedSubviews: [detailedDataObjects.peculiarities1, detailedDataObjects.peculiarities2])
    lazy var peculiaritiesStackView2 = UIStackView(arrangedSubviews: [detailedDataObjects.peculiarities3, detailedDataObjects.peculiarities4])
    lazy var peculiaritiesVerticalStackViewOverall = VerticalStackView(arrangedSubViews: [peculiaritiesStackView1, peculiaritiesStackView2])
    
    lazy var buttonsVerticalStack = VerticalStackView(arrangedSubViews: [CustomButton(frame: CGRect(x: 0, y: 0, width: 370, height: 150), highLabelTitle: "Удобства", lowLabelTitle: "Самое необходимое", sfSymbolString: "face.smiling"),
                                                                         CustomButton(frame: CGRect(x: 0, y: 0, width: 370, height: 150), highLabelTitle: "Что включено", lowLabelTitle: "Самое необходимое", sfSymbolString: "checkmark.square"),
                                                                         CustomButton(frame: CGRect(x: 0, y: 0, width: 370, height: 150), highLabelTitle: "Что не включено", lowLabelTitle: "Самое необходимое", sfSymbolString: "xmark.square")])
    
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
        
        mainDataViewModel.getHotel()
        bindViewModel()
                
        peculiaritiesVerticalStackViewOverall.spacing = 15
        peculiaritiesVerticalStackViewOverall.distribution = .fillEqually
        peculiaritiesStackView1.spacing = 15
        peculiaritiesStackView2.spacing = 15
        
        buttonsVerticalStack.distribution = .fillEqually
        buttonsVerticalStack.spacing = 15
        
        let mainDetailedDataAboutHotel = VerticalStackView(arrangedSubViews: [aboutHotelStackView,
                                                                              peculiaritiesVerticalStackViewOverall,
                                                                              detailedDataObjects.descriptionAboutHotel,
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
            
            detailedDataObjects.descriptionAboutHotel.topAnchor.constraint(equalTo: peculiaritiesVerticalStackViewOverall.bottomAnchor, constant: 20),
            detailedDataObjects.descriptionAboutHotel.heightAnchor.constraint(equalToConstant: 100),
            
            buttonsVerticalStack.topAnchor.constraint(equalTo: detailedDataObjects.descriptionAboutHotel.bottomAnchor, constant: 20),
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
