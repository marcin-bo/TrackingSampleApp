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
    
    private var navigationController: UINavigationController

    init() {
        let offersStorage = OffersInMemoryStorage()
        let viewModel = OfferListViewModel(offersStorage: offersStorage)
        self.navigationController = UINavigationController(
            rootViewController: OfferListViewController(viewModel: viewModel)
        )
        self.childCoordinators = [Coordinator]()
    }

    func start() {
        
    }
}
