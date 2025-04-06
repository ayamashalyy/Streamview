//
//  MainCoordinator.swift
//  Streamview
//
//  Created by Aya Mashaly on 06/04/2025.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    
    
    func start() {
        let onboarded = UserDefaults.standard.bool(forKey: "onboarded")
        if onboarded {
            showAuthFlow()
        } else {
            showSplashScreen()
        }
    }
    
    func eventOccurred(with type: AppEvent) {
        switch type {
        case .splashFinished:
            showOnboardingScreen()
        case .onboardingCompleted, .signInTapped:
            showAuthFlow()
        default:
            break
        }
    }
    
    private func showSplashScreen() {
        let splashVC = SplashScreenViewController()
        splashVC.coordinator = self
        navigationController?.pushViewController(splashVC, animated: false)
    }
    
    private func showOnboardingScreen() {
        let onboardingVC = ContainerPageVC()
        onboardingVC.coordinator = self
        navigationController?.setViewControllers([onboardingVC], animated: true)
    }
    
    private func showAuthFlow() {
        let child = AuthCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.start()
    }
}
