//
//  NativeAdPresenting.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 28/11/2021.
//

import UIKit

protocol NativeAdPresenting: Coordinator {
    var navigationController: UINavigationController { get }
    func presentNativeAd(machineName: String)
}

extension NativeAdPresenting {
    func presentNativeAd(machineName: String) {
        let nativeAdCoordinator = NativeAdCoordinator(
            navigationController: navigationController,
            machineName: machineName
        )
        nativeAdCoordinator.start()
        childCoordinators.append(nativeAdCoordinator)
    }
}
