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
        let feedStorage = FeedInMemoryStorage(
            articleStorage: ArticlesInMemoryStorage(),
            nativeAdsStorage: NativeAdsInMemoryStorage(),
            offersStorage: OffersInMemoryStorage()
        )
        let viewModel = FeedViewModel(feedStorage: feedStorage)
        
        self.navigationController = UINavigationController(
            rootViewController: FeedViewController(viewModel: viewModel)
        )
        self.childCoordinators = [Coordinator]()
    }

    func start() {
        
    }
}
