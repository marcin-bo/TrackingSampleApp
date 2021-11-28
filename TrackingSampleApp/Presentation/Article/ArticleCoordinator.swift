//
//  ArticleCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

import UIKit

final class ArticleCoordinator: Coordinator {
    let dependencies: RepositoryDependencies
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController {
        articleViewController
    }
    
    let navigationController: UINavigationController
    private let articleViewController: ArticleViewController

    init(
        navigationController: UINavigationController,
        machineName: String,
        dependencies: RepositoryDependencies
    ) {
        self.dependencies = dependencies
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
            if widget is Article {
                self?.presentArticle(machineName: widget.machineName)
            } else if widget is NativeAd {
                self?.presentNativeAd(machineName: widget.machineName)
            } else if widget is Offer {
                self?.presentOffer(machineName: widget.machineName)
            }
        }
        let actions = ArticleViewModelActions(didSelectWidget: didSelectWidget)
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
