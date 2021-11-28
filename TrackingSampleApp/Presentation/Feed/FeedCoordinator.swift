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
    
    let navigationController: UINavigationController
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
            self?.presentArticle(machineName: machineName)
        }
        feedViewController.didSelectNativeAd = { [weak self] machineName in
            self?.presentNativeAd(machineName: machineName)
        }
        feedViewController.didSelectOffer = { [weak self] machineName in
            self?.presentOffer(machineName: machineName)
        }
    }

    func start() {
        
    }
}

extension FeedCoordinator: ArticlePresenting { }
extension FeedCoordinator: NativeAdPresenting { }
extension FeedCoordinator: OfferPresenting { }
