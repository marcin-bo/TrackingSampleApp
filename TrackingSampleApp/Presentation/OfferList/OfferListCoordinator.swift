//
//  OfferListCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class OfferListCoordinator: Coordinator {
    let offersRepository: OffersRepository
    
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    let navigationController: UINavigationController
    private let offerListViewController: OfferListViewController

    init(offersRepository: OffersRepository) {
        self.offersRepository = offersRepository
        
        let viewModel = OfferListViewModel(offersRepository: offersRepository)
        self.offerListViewController = OfferListViewController(viewModel: viewModel)
        self.navigationController = UINavigationController(
            rootViewController: offerListViewController
        )
        setupActions()
    }
    
    private func setupActions() {
        let didSelectOffer: (Offer) -> Void = { [weak self] offer in
            self?.presentOffer(machineName: offer.machineName)
        }
        let actions = OfferListViewModelActions(didSelectOffer: didSelectOffer)
        offerListViewController.updateViewModelActions(actions)
    }

    func start() {
        
    }
}

extension OfferListCoordinator: OfferPresenting { }
