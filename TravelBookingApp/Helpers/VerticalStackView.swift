//
//  VerticalStackView.swift
//  TravelBookingApp
//
//  Created by Fixed on 01.02.24.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubViews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubViews.forEach({addArrangedSubview($0)})
        
        self.spacing = spacing
        self.axis = .vertical
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

