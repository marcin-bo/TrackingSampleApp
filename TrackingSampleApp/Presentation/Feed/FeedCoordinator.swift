//
//  FeedCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class FeedCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    private let navigationController: UINavigationController
    private let feedViewController: FeedViewController

    init() {
        let feedStorage = FeedStorage(
            articleRepository: ArticlesStorage(),
            nativeAdsRepository: NativeAdsStorage(),
            offersRepository: OffersStorage()
        )
        let viewModel = FeedViewModel(feedRepository: feedStorage)
        
        self.feedViewController = FeedViewController(viewModel: viewModel)
        self.navigationController = UINavigationController(
            rootViewController: feedViewController
        )
        self.childCoordinators = [Coordinator]()
        setupHandlers()
    }
    
    private func setupHandlers() {
        feedViewController.didSelectArticle = { [weak self] machineName in
            self?.openArticle(machineName: machineName)
        }
        feedViewController.didSelectNativeAd = { [weak self] machineName in
            self?.openNativeAd(machineName: machineName)
        }
        feedViewController.didSelectOffer = { [weak self] machineName in
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
