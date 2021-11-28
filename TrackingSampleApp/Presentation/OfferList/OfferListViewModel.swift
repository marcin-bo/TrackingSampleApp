//
//  OfferListViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

protocol OfferListViewModelInterface {
    // Output
    func count() -> Int
    func getOfferAt(index: Int) -> Offer?
    
    // Actions
    var actions: OfferListViewModelActions? { get set }
}

struct OfferListViewModelActions {
    let didSelectOffer: ((Offer) -> Void)?
}

struct OfferListViewModel {
    var actions: OfferListViewModelActions?
    private let offers: [Offer]
    
    init(offersRepository: OffersRepository) {
        self.offers = offersRepository.findAll()
    }
}

extension OfferListViewModel: OfferListViewModelInterface {
    func count() -> Int {
        offers.count
    }
    
    func getOfferAt(index: Int) -> Offer? {
        guard index < offers.count else { return nil }
        return offers[index]
    }
}
