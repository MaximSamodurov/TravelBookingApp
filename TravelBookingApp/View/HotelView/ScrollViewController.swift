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
    
    private let mainDataViewModel = MainDataViewModel()
    var pictures = [String]()

    private func bindViewModel() {
        mainDataViewModel.dataSource.bind { [weak self] _ in
            self?.pictures = self?.mainDataViewModel.dataSource.value?.imageUrls ?? []
            print(self?.mainDataViewModel.dataSource.value?.imageUrls)
#warning("НЕ приходят данные")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        mainDataViewModel.getHotel()
        bindViewModel()
        
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

        horizontalScrollView.backgroundColor = .white
        horizontalScrollView.contentSize = CGSize(width: Int(UIScreen.main.bounds.width) * pictures.count, height: 280)
        horizontalScrollView.layer.cornerRadius = 15
        horizontalScrollView.isPagingEnabled = true

//        addImage(title: pictures[0], position: 0)
//        addImage(title: pictures[1], position: 1)
//        addImage(title: pictures[2], position: 2)
        addImage(arrayImages: pictures)

        configurePageControl()
        horizontalScrollView.delegate = self

     func addImage(arrayImages: [String]) {

         
//         arrayImages.map { image in
//             let imageView = UIImageView()
//             imageView.image = UIImage(named: image)
//             imageView.frame = CGRect(x: screenWidth * CGFloat(position), y: 0, width: screenWidth, height: 280)
//             horizontalScrollView.addSubview(imageView)
//         }
         for arrayImage in arrayImages {
             let screenWidth = UIScreen.main.bounds.width
             let position = arrayImages.count - 1
             let imageView = UIImageView()
             imageView.image = UIImage(named: arrayImage)
             imageView.frame = CGRect(x: screenWidth * CGFloat(position), y: 0, width: screenWidth, height: 280)
             horizontalScrollView.addSubview(imageView)
             self.clipsToBounds = true
             self.contentView.addSubview(horizontalScrollView)
         }
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
