//
//  ArticleListCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class ArticleListCoordinator: Coordinator {
    let dependencies: RepositoryDependencies
    var childCoordinators = [Coordinator]()
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    let navigationController: UINavigationController
    private let articleListViewController: ArticleListViewController

    init(dependencies: RepositoryDependencies) {
        self.dependencies = dependencies
        
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
            self?.presentArticle(machineName: article.machineName)
        }
        let actions = ArticleListViewModelActions(didSelectArticle: didSelectArticle)
        articleListViewController.updateViewModelActions(actions)
    }

    func start() {
        
    }
}

extension ArticleListCoordinator: ArticlePresenting { }
