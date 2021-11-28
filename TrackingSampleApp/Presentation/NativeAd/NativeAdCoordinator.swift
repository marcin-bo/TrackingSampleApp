//
//  NativeAdCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

import UIKit

final class NativeAdCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    
    var rootViewController: UIViewController {
        nativeAdViewController
    }
    
    private let navigationController: UINavigationController
    private let nativeAdViewController: NativeAdViewController

    init(navigationController: UINavigationController, machineName: String) {
        self.navigationController = navigationController
        self.nativeAdViewController = NativeAdViewController(
            viewModel: NativeAdViewModel(
                nativeAdsRepository: NativeAdsStorage(),
                machineName: machineName
            )
        )
        self.childCoordinators = [Coordinator]()
        setupHandlers()
    }
    
    private func setupHandlers() {
        nativeAdViewController.didSelectArticle = { [weak self] machineName in
            self?.openArticle(machineName: machineName)
        }
        nativeAdViewController.didSelectOffer = { [weak self] machineName in
            self?.openOffer(machineName: machineName)
        }
    }

    func start() {
        navigationController.pushViewController(nativeAdViewController, animated: true)
    }
    
    private func openOffer(machineName: String) {
        let offerCoordinator = OfferCoordinator(
            navigationController: navigationController,
            machineName: machineName
        )
        offerCoordinator.start()
        childCoordinators.append(offerCoordinator)
    }
    
    private func openArticle(machineName: String) {
        let articleCoordinator = ArticleCoordinator(
            navigationController: navigationController,
            machineName: machineName
        )
        articleCoordinator.start()
        childCoordinators.append(articleCoordinator)
    }
}
