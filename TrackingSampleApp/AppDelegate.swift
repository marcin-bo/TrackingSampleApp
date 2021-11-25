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
        appFlowCoordinator = AppFlowCoordinator()
        window?.rootViewController = appFlowCoordinator?.rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
