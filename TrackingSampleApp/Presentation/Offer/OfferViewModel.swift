//
//  OfferViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

struct OfferViewModel {
    private let offersRepository: OffersRepository
    private let offer: Offer?
    
    init(offersRepository: OffersRepository, machineName: String) {
        self.offersRepository = offersRepository
        self.offer = offersRepository.findFirst(machineName: machineName)
    }
    
    var title: String? {
        offer?.title
    }
    
    var description: String? {
        offer?.description
    }
    
    var price: String {
        if let price = offer?.price {
            return "\(price)"
        }
        return ""
    }
}
