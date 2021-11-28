//
//  OfferListCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class OfferListCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    private let navigationController: UINavigationController
    private let offerListViewController: OfferListViewController

    init() {
        let viewModel = OfferListViewModel(offersRepository: OffersStorage())
        self.offerListViewController = OfferListViewController(viewModel: viewModel)
        self.navigationController = UINavigationController(
            rootViewController: offerListViewController
        )
        self.childCoordinators = [Coordinator]()
        setupHandlers()
    }
    
    private func setupHandlers() {
        offerListViewController.didSelectOffer = { [weak self] machineName in
            self?.openOffer(machineName: machineName)
        }
    }

    func start() {
        
    }
    
    private func openOffer(machineName: String) {
        let offerCoordinator = OfferCoordinator(
            navigationController: navigationController,
            machineName: machineName
        )
        offerCoordinator.start()
        childCoordinators.append(offerCoordinator)
    }
}
