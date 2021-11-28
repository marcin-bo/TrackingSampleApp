//
//  OfferViewModel.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

protocol OfferViewModelInterface {
    // Output
    var title: String? { get }
    var description: String? { get }
    var price: String { get }
    
    func trackOfferImpression()
    func trackOfferConversion()
    
    // Actions
    var actions: OfferViewModelActions? { get set }
}

struct OfferViewModelActions {
    let offerImpression: ((Offer) -> Void)?
    let offerConversion: ((Offer) -> Void)?
}

struct OfferViewModel {
    var actions: OfferViewModelActions?
    private let offersRepository: OffersRepository
    private let offer: Offer?
    
    init(offersRepository: OffersRepository, machineName: String) {
        self.offersRepository = offersRepository
        self.offer = offersRepository.findFirst(machineName: machineName)
    }
}

extension OfferViewModel: OfferViewModelInterface {
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
    
    func trackOfferImpression() {
        guard let offer = offer else { return }
        actions?.offerImpression?(offer)
    }
    
    func trackOfferConversion() {
        guard let offer = offer else { return }
        actions?.offerConversion?(offer)
    }
}
