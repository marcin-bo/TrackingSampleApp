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
        let feedInMemoryStorage = FeedInMemoryStorage(
            articleStorage: ArticlesInMemoryStorage(),
            nativeAdsStorage: NativeAdsInMemoryStorage(),
            offersStorage: OffersInMemoryStorage()
        )
        let feedViewModel = FeedViewModel(feedInMemoryStorage: feedInMemoryStorage)
        
        self.navigationController = UINavigationController(
            rootViewController: FeedViewController(viewModel: feedViewModel)
        )
        self.childCoordinators = [Coordinator]()
    }

    func start() {
        
    }
}
