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
    
    let navigationController: UINavigationController
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
extension NativeAdCoordinator: OfferPresenting { }
