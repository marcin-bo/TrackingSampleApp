//
//  AppFlowCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class AppFlowCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    
    var rootViewController: UIViewController {
        tabBarController
    }
    
    private let tabBarController: MainTabBarController
    
    init(repositoryContainer: RepositoryDependencies) {
        self.tabBarController = MainTabBarController()
        
        let feedCoordinator = FeedCoordinator(dependencies: repositoryContainer)
        let articleListCoordinator = ArticleListCoordinator(dependencies: repositoryContainer)
        let offerListCoordinator = OfferListCoordinator(offersRepository: repositoryContainer.offersRepository)
        
        let tab1 = feedCoordinator.rootViewController
        tab1.tabBarItem = UITabBarItem(
            title: "Feed",
            image: UIImage(named: "feed.png"),
            selectedImage: nil
        )
        
        let tab2 = articleListCoordinator.rootViewController
        tab2.tabBarItem = UITabBarItem(
            title: "Articles",
            image: UIImage(named: "article.png"),
            selectedImage: nil
        )
        
        let tab3 = offerListCoordinator.rootViewController
        tab3.tabBarItem = UITabBarItem(
            title: "Offers",
            image: UIImage(named: "offer.png"),
            selectedImage: nil
        )
        tabBarController.viewControllers = [tab1, tab2, tab3]
        
        childCoordinators = [feedCoordinator, articleListCoordinator, offerListCoordinator]
    }

    func start() {
        
    }
}
