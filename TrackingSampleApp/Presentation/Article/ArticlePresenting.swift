//
//  ArticlePresenting.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

import UIKit

protocol ArticlePresenting: Coordinator, ArticleTracking {
    var dependencies: RepositoryDependencies { get }
    var navigationController: UINavigationController { get }
    
    func presentArticle(machineName: String)
}

extension ArticlePresenting {
    func presentArticle(machineName: String) {
        let articleCoordinator = ArticleCoordinator(
            navigationController: navigationController,
            machineName: machineName,
            dependencies: dependencies,
            eventsTracking: eventsTracking,
            trackingOrigin: trackingOrigin
        )
        articleCoordinator.start()
        childCoordinators.append(articleCoordinator)
    }
}
