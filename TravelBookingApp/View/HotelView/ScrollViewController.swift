//
//  ScrollViewController.swift
//  TravelBookingApp
//
//  Created by Fixed on 04.02.24.
//

import UIKit

class ScrollViewController: UICollectionViewCell {
    
    let horizontalScrollView = UIScrollView()
    let pageControl = UIPageControl()
    let pictures = ["Club_Privé_by_Belek_Club_House", "interiorHotel", "Club_Privé_by_Belek_Club_House"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(horizontalScrollView)
        horizontalScrollView.contentMode = .scaleAspectFit
        horizontalScrollView.backgroundColor = .blue
        self.clipsToBounds = true
        horizontalScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalScrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            horizontalScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            horizontalScrollView.widthAnchor.constraint(equalToConstant: 370),
            horizontalScrollView.heightAnchor.constraint(equalToConstant: 280)
        ])

        horizontalScrollView.backgroundColor = .systemGray
        horizontalScrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * pictures.count, height: 280)
        horizontalScrollView.layer.cornerRadius = 15
        horizontalScrollView.isPagingEnabled = true

        addImage(title: pictures[0], position: 0)
        addImage(title: pictures[1], position: 1)
        addImage(title: pictures[2], position: 2)

        configurePageControl()
        horizontalScrollView.delegate = self

     func addImage(title: String, position: CGFloat) {
         let imageView = UIImageView()
         imageView.image = UIImage(named: title)

         let screenWidth = UIScreen.main.bounds.width
         imageView.frame = CGRect(x: screenWidth * position, y: 0, width: screenWidth, height: 280)
         horizontalScrollView.addSubview(imageView)
         self.contentView.addSubview(horizontalScrollView)
         self.clipsToBounds = true
     }

     func configurePageControl() {
         contentView.addSubview(pageControl)
         pageControl.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
             pageControl.topAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor, constant: -40),
             pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
         ])

         pageControl.numberOfPages = pictures.count
         pageControl.backgroundStyle = .prominent
         pageControl.isUserInteractionEnabled = false
     }

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScrollViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
