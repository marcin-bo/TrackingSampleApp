//
//  NativeAdCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

import UIKit

final class NativeAdCoordinator: Coordinator {
    let dependencies: RepositoryDependencies
    let eventsTracking: EventsTracking
    let trackingOrigin: TrackingOrigin
    
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController {
        nativeAdViewController
    }
    
    let navigationController: UINavigationController
    private let nativeAdViewController: NativeAdViewController

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
        self.nativeAdViewController = NativeAdViewController(
            viewModel: NativeAdViewModel(
                nativeAdsRepository: dependencies.nativeAdsRepository,
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
        
        let nativeAdImpression: (NativeAd) -> Void = { [weak self] nativeAd in
            self?.trackNativeAdImpression(nativeAd)
        }
        
        let actions = NativeAdViewModelActions(
            didSelectWidget: didSelectWidget,
            nativeAdImpression: nativeAdImpression
        )
        nativeAdViewController.updateViewModelActions(actions)
    }

    func start() {
        navigationController.pushViewController(nativeAdViewController, animated: true)
    }
}

extension NativeAdCoordinator: ArticlePresenting { }

extension NativeAdCoordinator: NativeAdPresenting { }

extension NativeAdCoordinator: OfferPresenting {
    var offersRepository: OffersRepository {
        dependencies.offersRepository
    }
}
