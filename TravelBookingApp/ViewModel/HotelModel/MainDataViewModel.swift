//
//  MainDataViewModel.swift
//  TravelBookingApp
//
//  Created by Fixed on 07.02.24.
//

import Foundation

class MainDataViewModel {
    
    var dataSource: Observable<HotelModel> = Observable(nil)
    
    func getHotel() {
        NetworkDataFetch.shared.fetchHotel { [weak self] hotel, error in
            guard let self else { return }
            if error != nil {
                print("Notify user about error")
            } else if let hotel {
                self.dataSource.value = hotel
            }
        }
    }
}
