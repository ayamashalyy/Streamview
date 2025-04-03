//
//  LoginViewController+UITextFieldDelegate .swift
//  Streamview
//
//  Created by Aya Mashaly on 01/04/2025.
//

import Foundation
import UIKit

extension LoginViewController: UITextFieldDelegate {
    
    func setUpTextFieldInError() {
        emailErrorLabel?.text = nil
        passwordErrorLabel?.text = nil
        emailErrorLabelHeightConstraint?.constant = 0
        passwordErrorLabelHeightConstraint?.constant = 0
    }
    
    // Called when the user finishes editing a text field (e.g., taps outside or presses return)
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            guard let email = emailTextField?.text, !email.isEmpty else {
                emailErrorLabel?.text = "Email is required"
                emailErrorLabelHeightConstraint?.constant = 18
                emailTextField?.layer.borderColor = UIColor.red.cgColor
                return
            }
            
            if AuthValidator.isStaticEmail(email){
                emailErrorLabel?.text = ""
                emailErrorLabelHeightConstraint?.constant = 0
                emailTextField?.layer.borderColor = UIColor(named: "ColorPlaceorder")?.cgColor
                
            } else {
                emailErrorLabel?.text = "Invalid email. Please enter the email again."
                emailErrorLabelHeightConstraint?.constant = 18
                emailTextField?.layer.borderColor = UIColor.red.cgColor
            }
        }
        
        if textField == passwordTextField {
            guard let password = passwordTextField?.text, !password.isEmpty else {
                passwordErrorLabel?.text = "Password is required"
                passwordErrorLabelHeightConstraint?.constant = 40
                passwordTextField?.layer.borderColor = UIColor.red.cgColor
                return
            }
            if AuthValidator.isStaticPassword(password){
                passwordErrorLabel?.text = ""
                passwordErrorLabelHeightConstraint?.constant = 0
                passwordTextField?.layer.borderColor = UIColor(named: "ColorPlaceorder")?.cgColor
            } else {
                passwordErrorLabel?.text = "Incorrect password. Please reenter your password and try again. If the problem persists, try resetting your password by click 'Forget Password?'."
                passwordErrorLabelHeightConstraint?.constant = 40
                passwordTextField?.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
    
    // Called when the user starts editing a text field (e.g., taps inside it)
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailErrorLabel?.text = ""
            emailErrorLabelHeightConstraint?.constant = 0
        } else if textField == passwordTextField {
            passwordErrorLabel?.text = ""
            passwordErrorLabelHeightConstraint?.constant = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField?.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
            textFieldDidEndEditing(textField)
        }
        return true
    }
}
