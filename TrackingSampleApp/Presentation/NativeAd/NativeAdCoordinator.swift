//
//  NativeAdCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

import UIKit

final class NativeAdCoordinator: Coordinator {
    let dependencies: RepositoryDependencies
    
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController {
        nativeAdViewController
    }
    
    let navigationController: UINavigationController
    private let nativeAdViewController: NativeAdViewController

    init(
        navigationController: UINavigationController,
        machineName: String,
        dependencies: RepositoryDependencies
    ) {
        self.dependencies = dependencies
        self.navigationController = navigationController
        self.nativeAdViewController = NativeAdViewController(
            viewModel: NativeAdViewModel(
                nativeAdsRepository: dependencies.nativeAdsRepository,
                machineName: machineName
            )
        )
        setupHandlers()
    }
    
    private func setupHandlers() {
        nativeAdViewController.didSelectArticle = { [weak self] machineName in
            self?.presentArticle(machineName: machineName)
        }
        nativeAdViewController.didSelectOffer = { [weak self] machineName in
            self?.presentOffer(machineName: machineName)
        }
    }

    func start() {
        navigationController.pushViewController(nativeAdViewController, animated: true)
    }
}

extension NativeAdCoordinator: ArticlePresenting { }

extension NativeAdCoordinator: OfferPresenting {
    var offersRepository: OffersRepository {
        dependencies.offersRepository
    }
}
