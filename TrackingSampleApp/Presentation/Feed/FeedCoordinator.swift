//
//  FeedCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class FeedCoordinator: Coordinator {
    let dependencies: RepositoryDependencies
    let eventsTracking: EventsTracking
    
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    let navigationController: UINavigationController
    private let feedViewController: FeedViewController

    init(
        dependencies: RepositoryDependencies,
        eventsTracking: EventsTracking
    ) {
        self.dependencies = dependencies
        self.eventsTracking = eventsTracking
        
        let viewModel = FeedViewModel(feedRepository: dependencies.feedRepository)
        
        self.feedViewController = FeedViewController(viewModel: viewModel)
        self.navigationController = UINavigationController(
            rootViewController: feedViewController
        )
        
        setupActions()
    }
    
    private func setupActions() {
        let didSelectWidget: (Widget) -> Void = { [weak self] widget in
            if let article = widget as? Article {
                self?.trackArticleClick(article)
                self?.presentArticle(machineName: widget.machineName)
            } else if let nativeAd = widget as? NativeAd {
                self?.trackNativeAdClick(nativeAd)
                self?.presentNativeAd(machineName: widget.machineName)
            } else if let offer = widget as? Offer {
                self?.trackOfferClick(offer)
                self?.presentOffer(machineName: widget.machineName)
            }
        }
        let actions = FeedViewModelActions(didSelectWidget: didSelectWidget)
        feedViewController.updateViewModelActions(actions)
    }

    func start() {
        
    }
}

extension FeedCoordinator: ArticlePresenting { }

extension FeedCoordinator: NativeAdPresenting { }

extension FeedCoordinator: OfferPresenting {
    var offersRepository: OffersRepository {
        dependencies.offersRepository
    }
}

extension FeedCoordinator: HasTrackingOrigin {
    var trackingOrigin: TrackingOrigin {
        .feed
    }
}
