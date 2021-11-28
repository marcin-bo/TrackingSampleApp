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
    
    private let navigationController: UINavigationController

    init() {
        let feedStorage = FeedStorage(
            articleRepository: ArticlesStorage(),
            nativeAdsRepository: NativeAdsStorage(),
            offersRepository: OffersStorage()
        )
        let viewModel = FeedViewModel(feedRepository: feedStorage)
        
        self.navigationController = UINavigationController(
            rootViewController: FeedViewController(viewModel: viewModel)
        )
        self.childCoordinators = [Coordinator]()
    }

    func start() {
        
    }
}
