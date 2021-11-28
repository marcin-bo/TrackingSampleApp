//
//  ArticleListCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class ArticleListCoordinator: Coordinator {
    let dependencies: RepositoryDependencies
    var childCoordinators: [Coordinator]
    
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
        self.childCoordinators = [Coordinator]()
        setupHandlers()
    }
    
    private func setupHandlers() {
        articleListViewController.didSelectArticle = { [weak self] machineName in
            self?.presentArticle(machineName: machineName)
        }
    }

    func start() {
        
    }
}

extension ArticleListCoordinator: ArticlePresenting { }
