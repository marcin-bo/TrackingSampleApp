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
        feedViewController.didSelectItem = { [weak self] widget in
            if widget is Article {
                self?.presentArticle(machineName: widget.machineName)
            } else if widget is NativeAd {
                self?.presentNativeAd(machineName: widget.machineName)
            } else if widget is Offer {
                self?.presentOffer(machineName: widget.machineName)
            }
        }
    }

    func start() {
        
    }
}

extension FeedCoordinator: ArticlePresenting { }
extension FeedCoordinator: NativeAdPresenting { }
extension FeedCoordinator: OfferPresenting { }
