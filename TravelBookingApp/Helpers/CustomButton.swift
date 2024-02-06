//
//  CustomButton.swift
//  TravelBookingApp
//
//  Created by Fixed on 06.02.24.
//

import UIKit

class CustomButton : UIButton {
    
    let highLabel: UILabel = {
        let label = UILabel()
        label.text = ""// данные из АПИ
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 1

        return label
    }()
    
    let lowLabel: UILabel = {
        let label = UILabel()
        label.text = "" // данные из АПИ
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 1

        return label
    }()
    
    let sfSymbol: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = .black
        iv.backgroundColor = .yellow
        iv.contentMode = .scaleAspectFit
        iv.constrainWidth(constant: 50)
        return iv
    }()
    
    
    let rightSfSymbol: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "chevron.right")
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFit
        iv.constrainWidth(constant: 15)
        return iv
    }()
    
    let spacer: UIView = {
        let view = UIView()
        view.constrainWidth(constant: 80)
        return view
    }()
    
    required init(frame: CGRect,highLabelTitle: String, lowLabelTitle: String, sfSymbolString: String) {
        super.init(frame: frame)
        
        let labelsVerticalStackView = VerticalStackView(arrangedSubViews: [highLabel, lowLabel])
        let overallStackView = UIStackView(arrangedSubviews: [sfSymbol,labelsVerticalStackView, spacer, rightSfSymbol])
        labelsVerticalStackView.alignment = .leading
        labelsVerticalStackView.spacing = 5
        labelsVerticalStackView.distribution = .fillEqually
        labelsVerticalStackView.clipsToBounds = true
        labelsVerticalStackView.isLayoutMarginsRelativeArrangement = true
        labelsVerticalStackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 35)
    

        overallStackView.distribution = .fill
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
                
        overallStackView.spacing = 15
        highLabel.text = highLabelTitle
        lowLabel.text = lowLabelTitle
        sfSymbol.image = UIImage(named: sfSymbolString)
        addSubview(overallStackView)
        backgroundColor = .init(white: 0.9, alpha: 0.1)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    

}
