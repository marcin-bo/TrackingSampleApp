//
//  ArticleCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

import UIKit

final class ArticleCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    
    var rootViewController: UIViewController {
        articleViewController
    }
    
    private let navigationController: UINavigationController
    private let articleViewController: ArticleViewController

    init(navigationController: UINavigationController, machineName: String) {
        self.navigationController = navigationController
        self.articleViewController = ArticleViewController(
            viewModel: ArticleViewModel(
                articlesRepository: ArticlesStorage(),
                machineName: machineName
            )
        )
        self.childCoordinators = [Coordinator]()
        setupHandlers()
    }

    private func setupHandlers() {
        articleViewController.didSelectArticle = { [weak self] machineName in
            self?.openArticle(machineName: machineName)
        }
        articleViewController.didSelectNativeAd = { [weak self] machineName in
            self?.openNativeAd(machineName: machineName)
        }
        articleViewController.didSelectOffer = { [weak self] machineName in
            self?.openOffer(machineName: machineName)
        }
    }

    func start() {
        navigationController.pushViewController(articleViewController, animated: true)
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
    
    private func openNativeAd(machineName: String) {
        let nativeAdCoordinator = NativeAdCoordinator(
            navigationController: navigationController,
            machineName: machineName
        )
        nativeAdCoordinator.start()
        childCoordinators.append(nativeAdCoordinator)
    }
}
