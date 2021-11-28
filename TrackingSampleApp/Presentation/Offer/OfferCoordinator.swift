//
//  OfferCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

import UIKit

final class OfferCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    
    var rootViewController: UIViewController {
        offerViewController
    }
    
    private let navigationController: UINavigationController
    private let offerViewController: OfferViewController

    init(navigationController: UINavigationController, machineName: String) {
        self.navigationController = navigationController
        self.offerViewController = OfferViewController(
            viewModel: OfferViewModel(
                offersRepository: OffersStorage(),
                machineName: machineName
            )
        )
        self.childCoordinators = [Coordinator]()
    }

    func start() {
        navigationController.pushViewController(offerViewController, animated: true)
    }
}