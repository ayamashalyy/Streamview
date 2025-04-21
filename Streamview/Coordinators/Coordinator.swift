//
//  Coordinator.swift
//  Streamview
//
//  Created by Aya Mashaly on 06/04/2025.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var navigationController: UINavigationController? { get set }
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    func eventOccurred(with type: AppEvent)
    func start()
    func removeChildCoordinator(_ coordinator: Coordinator)
}

protocol Coordinating: AnyObject {
    var coordinator: Coordinator? { get set }
}
