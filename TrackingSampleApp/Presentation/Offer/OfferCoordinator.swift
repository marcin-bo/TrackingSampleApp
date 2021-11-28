//
//  OfferCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 27/11/2021.
//

import UIKit

final class OfferCoordinator: Coordinator {
    let eventsTracking: EventsTracking
    let trackingOrigin: TrackingOrigin
    
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController {
        offerViewController
    }
    
    private let navigationController: UINavigationController
    private let offerViewController: OfferViewController

    init(
        navigationController: UINavigationController,
        machineName: String,
        offersRepository: OffersRepository,
        eventsTracking: EventsTracking,
        trackingOrigin: TrackingOrigin
    ) {
        self.eventsTracking = eventsTracking
        self.trackingOrigin = trackingOrigin
        self.navigationController = navigationController
        self.offerViewController = OfferViewController(
            viewModel: OfferViewModel(
                offersRepository: offersRepository,
                machineName: machineName
            )
        )
        setupActions()
    }

    private func setupActions() {
        let offerImpression: (Offer) -> Void = { [weak self] offer in
            self?.trackOfferImpression(offer)
        }
        let offerConversion: (Offer) -> Void = { [weak self] offer in
            self?.trackOfferConversion(offer)
        }
        let actions = OfferViewModelActions(
            offerImpression: offerImpression,
            offerConversion: offerConversion
        )
        offerViewController.updateViewModelActions(actions)
    }

    func start() {
        navigationController.pushViewController(offerViewController, animated: true)
    }
}

extension OfferCoordinator: OfferTracking { }
