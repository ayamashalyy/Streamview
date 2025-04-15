//
//  AuthCoordinator.swift
//  Streamview
//
//  Created by Aya Mashaly on 06/04/2025.
//

import Foundation
import UIKit

class AuthCoordinator: Coordinator  {
    
    var navigationController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func eventOccurred(with type: AppEvent) {
        switch type {
        case let event as AuthNavigationEvent:
            switch event {
            case .didLoginSuccessfully:
                let homeVC = HomeViewController()
                homeVC.modalPresentationStyle = .fullScreen
                navigationController?.present(homeVC, animated: true) { [weak self] in
                    guard let self = self else { return }
                    self.parentCoordinator?.removeChildCoordinator(self)
                }
            case .didTapForgotPassword:
                showOTPScreen()
            case .didTapSignUp:
                showSignUpScreen()
            case .didVerifyOTP:
                showForgotPasswordScreen()
            case .didVerifyEmail:
                showCreateNewPasswordScreen()
            case .didCompleteSignUp:
                showCreateProfileScreen()
            default:
                break
            }
            
        case let event as ProfileEvent:
            switch event {
            case .didTapCreatePin:
                showCeatePinProfileScreen()
            case .didCreateProfile:
                showChooseInterestsScreen()
            }
            
        case let event as SettingsEvent:
            switch event {
            case .didTapFamilySharing:
                showFamilySharingScreen()
            }
            
        case let event as GeneralEvent:
            switch event {
            case .didDismiss:
                navigationController?.popViewController(animated: true)
            }
            
        default:
            break
        }
    }
    
    func start() {
        showLoginScreen()
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.removeAll { $0 === coordinator }
    }
    
    private func showLoginScreen() {
        let loginVC = LoginViewController()
        loginVC.coordinator = self
        navigationController?.setViewControllers([loginVC], animated: false)
    }
    
    private func showOTPScreen() {
        let otpVC = OTPViewController()
        otpVC.coordinator = self
        navigationController?.pushViewController(otpVC, animated: true)
    }
    
    private func  showForgotPasswordScreen() {
        let otpVC = ForgotPasswordViewController()
        otpVC.coordinator = self
        navigationController?.pushViewController(otpVC, animated: true)
    }
    
    private func showSignUpScreen() {
        let signUPVC = SignUpViewController()
        signUPVC.coordinator = self
        navigationController?.pushViewController(signUPVC, animated: true)
    }
    
    private func showCreateNewPasswordScreen() {
        let createNewPasswordVC = CreateNewPasswordViewController()
        createNewPasswordVC.coordinator = self
        navigationController?.pushViewController(createNewPasswordVC, animated: true)
    }
    
    private func showCreateProfileScreen() {
        let createProfileVC = CreateProfileViewController()
        createProfileVC.coordinator = self
        navigationController?.pushViewController(createProfileVC, animated: true)
    }
    
    private func showCeatePinProfileScreen() {
        let createPinProfileVC = CreatePinViewController()
        createPinProfileVC.coordinator = self
        navigationController?.pushViewController(createPinProfileVC, animated: true)
    }
    
    private func showFamilySharingScreen() {
        let familySharingProfileVC = FamilySharingViewController()
        familySharingProfileVC.coordinator = self
        navigationController?.pushViewController(familySharingProfileVC, animated: true)
    }
    
    private func showChooseInterestsScreen() {
        let chooseInterestsVC = ChooseInterestsViewController()
        chooseInterestsVC.coordinator = self
        navigationController?.pushViewController(chooseInterestsVC, animated: true)
    }
}
