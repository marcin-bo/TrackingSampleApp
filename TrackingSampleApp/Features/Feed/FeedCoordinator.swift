//
//  FeedCoordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

final class FeedCoordinator: Coordinator {
    var childCoordinators: [Coordinator]
    
    var rootViewController: UIViewController {
        navigationController
    }
    
    private var navigationController: UINavigationController

    init() {
        let widgets: [Widget] = FeedInMemoryStorage(
            articleStorage: ArticlesInMemoryStorage(),
            nativeAdsStorage: NativeAdsInMemoryStorage(),
            offersStorage: OffersInMemoryStorage())
            .findAll()
        let feedViewModel = FeedViewModel(widgets: widgets)
        
        self.navigationController = UINavigationController(
            rootViewController: FeedViewController(viewModel: feedViewModel)
        )
        self.childCoordinators = [Coordinator]()
    }

    func start() {
        
    }
}
