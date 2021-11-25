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
        self.navigationController = UINavigationController(rootViewController: ArticleListViewController())
        self.childCoordinators = [Coordinator]()
    }

    func start() {
        
    }
}
