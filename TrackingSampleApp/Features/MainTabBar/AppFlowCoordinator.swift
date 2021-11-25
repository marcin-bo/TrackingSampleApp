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
    
    init() {
        self.tabBarController = MainTabBarController()
        
        let homeCoordinator = HomeCoordinator()
        let articleListCoordinator = ArticleListCoordinator()
        let offerListCoordinator = OfferListCoordinator()
        
        let tab1 = homeCoordinator.rootViewController
        tab1.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(named: "tab1.png"),
            selectedImage: nil
        )
        
        let tab2 = articleListCoordinator.rootViewController
        tab2.tabBarItem = UITabBarItem(
            title: "Articles",
            image: UIImage(named: "tab2.png"),
            selectedImage: nil
        )
        
        let tab3 = offerListCoordinator.rootViewController
        tab3.tabBarItem = UITabBarItem(
            title: "Offers",
            image: UIImage(named: "tab3.png"),
            selectedImage: nil
        )
        tabBarController.viewControllers = [tab1, tab2, tab3]
        
        childCoordinators = [homeCoordinator, articleListCoordinator, offerListCoordinator]
    }

    func start() {
        
    }
}
