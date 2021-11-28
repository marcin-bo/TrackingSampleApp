//
//  Coordinator.swift
//  TrackingSampleApp
//
//  Created by Marcin Borek on 24/11/2021.
//

import UIKit

// FIXME: implement removin child coordinators from array
protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    
    var rootViewController: UIViewController { get }
    
    func start()
}

extension Coordinator {
    func add(childCoordinator: Coordinator) {
        childCoordinators.append(childCoordinator)
    }
    
    func remove(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
}
