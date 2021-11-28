//
//  AppDelegate.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 23/11/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appFlowCoordinator: AppFlowCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let articlesRepository = ArticlesStorage()
        let nativeAdsRepository = NativeAdsStorage()
        let offersRepository = OffersStorage()
        let feedRepository = FeedStorage(
            articleRepository: articlesRepository,
            nativeAdsRepository: nativeAdsRepository,
            offersRepository: offersRepository
        )
        let repositoryContainer = RepositoryContainer(
            articlesRepository: articlesRepository,
            feedRepository: feedRepository,
            nativeAdsRepository: nativeAdsRepository,
            offersRepository: offersRepository
        )
        
        let eventsTracking: EventsTracking = TrackingService()
        
        appFlowCoordinator = AppFlowCoordinator(
            repositoryContainer: repositoryContainer,
            eventsTracking: eventsTracking
        )
        window?.rootViewController = appFlowCoordinator?.rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
