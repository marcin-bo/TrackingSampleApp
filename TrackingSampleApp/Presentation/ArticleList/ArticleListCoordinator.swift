//
//  ArticleListCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class ArticleListCoordinator: Coordinator {
    let dependencies: RepositoryDependencies
    let eventsTracking: EventsTracking
    
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    let navigationController: UINavigationController
    private let articleListViewController: ArticleListViewController

    init(
        dependencies: RepositoryDependencies,
        eventsTracking: EventsTracking
    ) {
        self.dependencies = dependencies
        self.eventsTracking = eventsTracking
        
        let viewModel = ArticleListViewModel(
            articlesRepository: dependencies.articlesRepository
        )
        self.articleListViewController = ArticleListViewController(viewModel: viewModel)
        self.navigationController = UINavigationController(
            rootViewController: articleListViewController
        )
        setupActions()
    }
    
    private func setupActions() {
        let didSelectArticle: (Article) -> Void = { [weak self] article in
            self?.trackArticleClick(article)
            self?.presentArticle(machineName: article.machineName)
        }
        let actions = ArticleListViewModelActions(didSelectArticle: didSelectArticle)
        articleListViewController.updateViewModelActions(actions)
    }

    func start() {
        
    }
}

extension ArticleListCoordinator: ArticlePresenting { }

extension ArticleListCoordinator: HasTrackingOrigin {
    var trackingOrigin: TrackingOrigin {
        .articleList
    }
}
