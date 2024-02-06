//
//  HotelViewController.swift
//  TravelBookingApp
//
//  Created by Fixed on 30.01.24.
//

import UIKit

class HotelViewController: UIViewController {
    
    var collectionView: UICollectionView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        view.backgroundColor = .white

    }

    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        collectionView.register(ScrollViewController.self, forCellWithReuseIdentifier: "\(ScrollViewController.self)")
        collectionView.register(MainDataAboutHotel.self, forCellWithReuseIdentifier: "\(MainDataAboutHotel.self)")
        collectionView.register(DetailedDataAboutHotel.self, forCellWithReuseIdentifier: "\(DetailedDataAboutHotel.self)")
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
        collectionView.dataSource = self
        collectionView.isScrollEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.alwaysBounceVertical = true
    }
    
    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }
    
}

extension HotelViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      if indexPath.section == 0 {
        let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ScrollViewController.self)", for: indexPath)

        guard let cellOne = dequeuedCell as? ScrollViewController else {
          fatalError("Wrong cell type for section 0. Expected CellTypeOne")
        }

        // configure your CellTypeOne

        return cellOne
      } else if indexPath.section == 1 {
        let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainDataAboutHotel.self)", for: indexPath)

        guard let cellTwo = dequeuedCell as? MainDataAboutHotel else {
          fatalError("Wrong cell type for section 0. Expected CellTypeTwo")
        }

        // configure your CellTypeTwo

        return cellTwo
      } else if indexPath.section == 2 {
          let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DetailedDataAboutHotel.self)", for: indexPath)
          
          guard let cellThree = dequeuedCell as? DetailedDataAboutHotel else {
              fatalError("Wrong cell type for section 0. Expected CellTypeTwo")
          }
          
          // configure your CellTypeTwo
          
          return cellThree
      }
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
     
}

