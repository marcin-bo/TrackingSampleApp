//
//  OfferListCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class OfferListCoordinator: Coordinator {
    let offersRepository: OffersRepository
    var childCoordinators: [Coordinator]
    
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
        self.childCoordinators = [Coordinator]()
        setupHandlers()
    }
    
    private func setupHandlers() {
        offerListViewController.didSelectOffer = { [weak self] machineName in
            self?.presentOffer(machineName: machineName)
        }
    }

    func start() {
        
    }
}

extension OfferListCoordinator: OfferPresenting { }
