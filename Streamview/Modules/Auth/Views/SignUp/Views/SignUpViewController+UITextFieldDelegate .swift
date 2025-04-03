//
//      SignUpViewController+UITextFieldDelegate .swift
//  Streamview
//
//  Created by Aya Mashaly on 02/04/2025.
//

import Foundation
import UIKit

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == passwordTextField {
            guard let password = passwordTextField?.text, !password.isEmpty else {
                passwordRequirementLabel?.text = "Password is required"
                passwordRequirementStackHeightConstraint?.constant = 30
                checkmarkImageView?.isHidden = true
                passwordTextField?.layer.borderColor = UIColor.red.cgColor
                passwordRequirementLabel?.textColor = .red
                return
            }
            
            if AuthValidator.isValidPassword(password) {
                passwordRequirementLabel?.text = "Password must be at least 8 character, uppercase, lowercase, and unique code like #%!"
                passwordRequirementStackHeightConstraint?.constant = 30
                checkmarkImageView?.isHidden = false
                passwordTextField?.layer.borderColor = UIColor(named: "ColorPlaceorder")?.cgColor
                passwordRequirementLabel?.textColor = UIColor(named: "OnboardingDescColor")
            } else {
                passwordRequirementLabel?.text = "Password must be at least 8 character, uppercase, lowercase, and unique code like #%!"
                passwordRequirementStackHeightConstraint?.constant = 30
                checkmarkImageView?.isHidden = true
                passwordTextField?.layer.borderColor = UIColor.red.cgColor
                passwordRequirementLabel?.textColor = .red
            }
        }
            
        if textField == confirmPasswordTextField {
            guard let confirmPassword = confirmPasswordTextField?.text, !confirmPassword.isEmpty else {
                passwordRequirementLabel?.text = "Confirm Password is required"
                passwordRequirementStackHeightConstraint?.constant = 30
                checkmarkImageView?.isHidden = true
                confirmPasswordTextField?.layer.borderColor = UIColor.red.cgColor
                passwordRequirementLabel?.textColor = .red
                return
            }
            
            guard let newPassword = passwordTextField?.text, AuthValidator.isValidPassword(newPassword) else {
                passwordRequirementLabel?.text = "Please ensure the new password meets the requirements first"
                passwordRequirementStackHeightConstraint?.constant = 30
                checkmarkImageView?.isHidden = true
                confirmPasswordTextField?.layer.borderColor = UIColor.red.cgColor
                passwordRequirementLabel?.textColor = .red
                return
            }
            
            if confirmPassword == newPassword {
                passwordRequirementLabel?.text = "Password must be at least 8 character, uppercase, lowercase, and unique code like #%!"
                passwordRequirementStackHeightConstraint?.constant = 30
                checkmarkImageView?.isHidden = false
                confirmPasswordTextField?.layer.borderColor = UIColor(named: "ColorPlaceorder")?.cgColor
                passwordRequirementLabel?.textColor = UIColor(named: "OnboardingDescColor")
            } else {
                passwordRequirementLabel?.text = "Passwords do not match"
                passwordRequirementStackHeightConstraint?.constant = 30
                checkmarkImageView?.isHidden = true
                confirmPasswordTextField?.layer.borderColor = UIColor.red.cgColor
                passwordRequirementLabel?.textColor = .red
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passwordTextField || textField == confirmPasswordTextField {
            passwordRequirementLabel?.text = "Password must be at least 8 character, uppercase, lowercase, and unique code like #%!"
            passwordRequirementStackHeightConstraint?.constant = 30
            checkmarkImageView?.isHidden = true
            passwordRequirementLabel?.textColor = .red
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            birthdayTextField?.becomeFirstResponder()
        } else if textField == birthdayTextField {
            passwordTextField?.becomeFirstResponder()
        } else if textField == passwordTextField {
            confirmPasswordTextField?.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
