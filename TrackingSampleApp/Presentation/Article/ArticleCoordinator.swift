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
    
    let navigationController: UINavigationController
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
            self?.presentArticle(machineName: machineName)
        }
        articleViewController.didSelectNativeAd = { [weak self] machineName in
            self?.presentNativeAd(machineName: machineName)
        }
        articleViewController.didSelectOffer = { [weak self] machineName in
            self?.presentOffer(machineName: machineName)
        }
    }

    func start() {
        navigationController.pushViewController(articleViewController, animated: true)
    }
}

extension ArticleCoordinator: ArticlePresenting { }
extension ArticleCoordinator: NativeAdPresenting { }
extension ArticleCoordinator: OfferPresenting { }
