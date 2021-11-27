//
//  ArticleListCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class ArticleListCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    private var navigationController: UINavigationController

    init() {
        let articlesStorage = ArticlesInMemoryStorage()
        let viewModel = ArticleListViewModel(articlesStorage: articlesStorage)
        self.navigationController = UINavigationController(
            rootViewController: ArticleListViewController(viewModel: viewModel)
        )
        self.childCoordinators = [Coordinator]()
    }

    func start() {
        
    }
}
