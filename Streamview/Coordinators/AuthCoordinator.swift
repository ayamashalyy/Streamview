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
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func eventOccurred(with type: AppEvent) {
        switch type {
        case .loginSuccessful:
            let homeVC = HomeViewController()
            homeVC.modalPresentationStyle = .fullScreen
            navigationController?.present(homeVC, animated: true, completion: nil)
        case .forgotPasswordTapped:
            showOTPScreen()
        case .signUpTapped:
            showSignUpScreen()
        case .otpVerified:
            showForgotPasswordScreen()
        case .emailVerified:
            showCreateNewPasswordScreen()
        case .signUpSuccessful:
            showCreateProfileScreen()
        case .createPinTapped:
            showCeatePinProfileScreen()
        case .familySharingTapped:
            showFamilySharingScreen()
        case .profileCreated:
            showChooseInterestsScreen()
        case .dismiss:
            navigationController?.popViewController(animated: true)
        default:
            break
        }
    }
    
    func start() {
        showLoginScreen()
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
