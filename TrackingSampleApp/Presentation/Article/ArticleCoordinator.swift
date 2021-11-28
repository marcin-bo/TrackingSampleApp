//
//  ArticleCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

import UIKit

final class ArticleCoordinator: Coordinator {
    let dependencies: RepositoryDependencies
    let eventsTracking: EventsTracking
    let trackingOrigin: TrackingOrigin
    
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController {
        articleViewController
    }
    
    let navigationController: UINavigationController
    private let articleViewController: ArticleViewController

    init(
        navigationController: UINavigationController,
        machineName: String,
        dependencies: RepositoryDependencies,
        eventsTracking: EventsTracking,
        trackingOrigin: TrackingOrigin
    ) {
        self.dependencies = dependencies
        self.eventsTracking = eventsTracking
        self.trackingOrigin = trackingOrigin
        self.navigationController = navigationController
        self.articleViewController = ArticleViewController(
            viewModel: ArticleViewModel(
                articlesRepository: dependencies.articlesRepository,
                machineName: machineName
            )
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
        
        let articleImpression: (Article) -> Void = { [weak self] article in
            self?.trackArticleImpression(article)
        }
        
        let actions = ArticleViewModelActions(
            didSelectWidget: didSelectWidget,
            articleImpression: articleImpression
        )
        articleViewController.updateViewModelActions(actions)
    }

    func start() {
        navigationController.pushViewController(articleViewController, animated: true)
    }
}

extension ArticleCoordinator: ArticlePresenting { }

extension ArticleCoordinator: NativeAdPresenting { }

extension ArticleCoordinator: OfferPresenting {
    var offersRepository: OffersRepository {
        dependencies.offersRepository
    }
}
