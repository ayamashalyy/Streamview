//
//  CreateNewPasswordViewController.swift
//  Streamview
//
//  Created by Aya Mashaly on 27/03/2025.
//

import UIKit

class CreateNewPasswordViewController: UIViewController {
    
    @IBOutlet weak var newPasswordTextField: UITextField?
    @IBOutlet weak var confirmPasswordTextField: UITextField?
    @IBOutlet weak var continueButton: UIButton?
    @IBOutlet weak var passwordRequirementLabel: UILabel?
    @IBOutlet weak var checkmarkImageView: UIImageView?
    @IBOutlet weak var passwordRequirementStackHeightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newPasswordTextField?.delegate = self
        confirmPasswordTextField?.delegate = self
        setUpPasswordRequirementLabel()
    }
    
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        guard let newPassword = newPasswordTextField?.text, let confirmPassword = confirmPasswordTextField?.text else { return }
        if newPassword == confirmPassword && AuthValidator.isValidPassword(newPassword) {
            showSuccessAlert(message: "Password updated successfully!") {
                let loginVC = LoginViewController()
                loginVC.modalPresentationStyle = .fullScreen
                self.present(loginVC, animated: true, completion: nil)
            }
        } else {
            showFailureAlert(message: "Passwords do not match or do not meet requirements.")
        }
    }
    
    func setUpPasswordRequirementLabel() {
        passwordRequirementLabel?.text = "Password must be at least 8 character, uppercase, lowercase, and unique code like #%!"
        passwordRequirementStackHeightConstraint?.constant = 30
        checkmarkImageView?.isHidden = true
        passwordRequirementLabel?.textColor = .red
    }
    
    @IBAction func dismissScreen(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}
