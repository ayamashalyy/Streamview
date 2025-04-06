//
//  LoginViewController.swift
//  Streamview
//
//  Created by Aya Mashaly on 02/03/2025.
//

import UIKit

class LoginViewController: UIViewController, Coordinating {
    
    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    @IBOutlet weak var continueButton: UIButton?
    @IBOutlet weak var forgotPasswordButton: UIButton?
    @IBOutlet weak var googleLoginButton: UIButton?
    @IBOutlet weak var appleLoginButton: UIButton?
    @IBOutlet weak var facebookLoginButton: UIButton?
    @IBOutlet weak var signUpButton: UIButton?
    @IBOutlet weak var emailErrorLabel: UILabel?
    @IBOutlet weak var passwordErrorLabel: UILabel?
    @IBOutlet weak var emailErrorLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var passwordErrorLabelHeightConstraint: NSLayoutConstraint!
    var coordinator: Coordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField?.delegate = self
        passwordTextField?.delegate = self
        setUpTextFieldInError()
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        let email = emailTextField?.text ?? ""
        let password = passwordTextField?.text ?? ""
        
        if AuthValidator.isStaticEmail(email) && AuthValidator.isStaticPassword(password) {
            showSuccessAlert(message: "Login successful!") {
                self.coordinator?.eventOccurred(with: .loginSuccessful)
            }
            
        } else {
            showFailureAlert(message: "Invalid email or password. Please try again.")
        }
    }
    
    @IBAction func forgotPasswordTapped(_ sender: UIButton) {
        coordinator?.eventOccurred(with: .forgotPasswordTapped)
    }
    
    @IBAction func googleLoginTapped(_ sender: UIButton) {
    }
    
    @IBAction func appleLoginTapped(_ sender: UIButton) {
    }
    
    @IBAction func facebookLoginTapped(_ sender: UIButton) {
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        coordinator?.eventOccurred(with: .signUpTapped)
    }
}
