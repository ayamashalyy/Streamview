//
//  ForgotPasswordViewController.swift
//  Streamview
//
//  Created by Aya Mashaly on 27/03/2025.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var continueButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        let email = emailTextField?.text ?? ""
        if AuthValidator.isStaticEmail(email) {
            showSuccessAlert(message: "Email is valid. Proceeding to password reset!") {
                let createNewPasswordVC = CreateNewPasswordViewController()
                createNewPasswordVC.modalPresentationStyle = .fullScreen
                self.present(createNewPasswordVC, animated: true)
            }
        } else {
            showFailureAlert(message: "Invalid email. Please try again.")
        }
    }
    
    @IBAction func dismissScreen(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
