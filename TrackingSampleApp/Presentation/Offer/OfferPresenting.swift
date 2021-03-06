//
//  OfferPresenting.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

import UIKit

protocol OfferPresenting: Coordinator, HasOffersRepository, OfferTracking {
    var navigationController: UINavigationController { get }
    
    func presentOffer(machineName: String)
}

extension OfferPresenting {
    func presentOffer(machineName: String) {
        let offerCoordinator = OfferCoordinator(
            navigationController: navigationController,
            machineName: machineName,
            offersRepository: offersRepository,
            eventsTracking: eventsTracking,
            trackingOrigin: trackingOrigin
        )
        offerCoordinator.start()
        childCoordinators.append(offerCoordinator)
    }
}
