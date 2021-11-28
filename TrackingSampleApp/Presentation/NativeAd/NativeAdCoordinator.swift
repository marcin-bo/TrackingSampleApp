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
        setupActions()
    }
    
    private func setupActions() {
        let didSelectWidget: (Widget) -> Void = { [weak self] widget in
            if widget is Article {
                self?.presentArticle(machineName: widget.machineName)
            } else if widget is NativeAd {
                self?.presentNativeAd(machineName: widget.machineName)
            } else if widget is Offer {
                self?.presentOffer(machineName: widget.machineName)
            }
        }
        let actions = NativeAdViewModelActions(didSelectWidget: didSelectWidget)
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
