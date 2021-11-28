//
//  OfferCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

import UIKit

final class OfferCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController {
        offerViewController
    }
    
    private let navigationController: UINavigationController
    private let offerViewController: OfferViewController

    init(
        navigationController: UINavigationController,
        machineName: String,
        offersRepository: OffersRepository
    ) {
        self.navigationController = navigationController
        self.offerViewController = OfferViewController(
            viewModel: OfferViewModel(
                offersRepository: offersRepository,
                machineName: machineName
            )
        )
    }

    func start() {
        navigationController.pushViewController(offerViewController, animated: true)
    }
}
