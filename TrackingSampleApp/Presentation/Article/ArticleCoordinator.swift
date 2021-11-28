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
    
    private let navigationController: UINavigationController
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
    }

    func start() {
        navigationController.pushViewController(articleViewController, animated: true)
    }
}
