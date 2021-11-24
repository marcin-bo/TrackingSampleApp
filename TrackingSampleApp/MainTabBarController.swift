//
//  MainTabBarController.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBars()
        view.backgroundColor = .systemPink
    }

    private func setupTabBars() {
        let tab1 = HomeViewController()
        let tab1BarItem = UITabBarItem(
            title: "Home",
            image: UIImage(named: "tab1.png"),
            selectedImage: nil
        )
        tab1.tabBarItem = tab1BarItem
        
        let tab2 = ArticleListViewController()
        let tab2BarItem = UITabBarItem(
            title: "Articles",
            image: UIImage(named: "tab2.png"),
            selectedImage: nil
        )
        tab2.tabBarItem = tab2BarItem
        
        let tab3 = OffersListViewController()
        let tab3BarItem = UITabBarItem(
            title: "Offers",
            image: UIImage(named: "tab3.png"),
            selectedImage: nil
        )
        tab3.tabBarItem = tab3BarItem
        
        self.viewControllers = [tab1, tab2, tab3]
    }
}
