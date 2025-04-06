//
//  SignUpViewController.swift
//  Streamview
//
//  Created by Aya Mashaly on 30/03/2025.
//

import UIKit

class SignUpViewController: UIViewController, Coordinating{
    
    @IBOutlet weak var emailTextField: UITextField?
    @IBOutlet weak var birthdayTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    @IBOutlet weak var confirmPasswordTextField: UITextField?
    @IBOutlet weak var termsLabel: UILabel?
    @IBOutlet weak var agreeButton: UIButton?
    @IBOutlet weak var passwordRequirementLabel: UILabel?
    @IBOutlet weak var checkmarkImageView: UIImageView?
    @IBOutlet weak var passwordRequirementStackHeightConstraint: NSLayoutConstraint?
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTermsLabel()
        passwordTextField?.delegate = self
        birthdayTextField?.delegate = self
        emailTextField?.delegate = self
        confirmPasswordTextField?.delegate = self
        setUpPasswordRequirementLabel()
    }
    
    @IBAction func agreeButtonTapped(_ sender: UIButton) {
        //        guard let email = emailTextField?.text, !email.isEmpty,
        //              let birthday = birthdayTextField?.text, !birthday.isEmpty,
        //              let password = passwordTextField?.text, !password.isEmpty,
        //              let confirmPassword = confirmPasswordTextField?.text, !confirmPassword.isEmpty else {
        //            showAlert(message: "Please fill in all the fields.")
        //            return
        //        }
        //
        //        showSuccessAlert(message: "Signup completed! Please log in.") {
        coordinator?.eventOccurred(with: .signUpSuccessful)
        //}
    }
    
    @IBAction func dismissScreen(_ sender: UIBarButtonItem) {
        coordinator?.eventOccurred(with: .dismiss)
    }
    
    func setUpTermsLabel() {
        let text = "By click the agree and continue button, you’re agree to Movees’ Terms and Service and acknlowledge the Privacy and Policy"
        
        let attributedString = NSMutableAttributedString(string: text)
        
        let termsRange = (text as NSString).range(of: "Terms and Service")
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: termsRange)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 11), range: termsRange)
        
        let privacyRange = (text as NSString).range(of: "Privacy and Policy")
        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: privacyRange)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 11), range: privacyRange)
        
        termsLabel?.attributedText = attributedString
    }
    
    func setUpPasswordRequirementLabel() {
        passwordRequirementLabel?.text = "Password must be at least 8 character, uppercase, lowercase, and unique code like #%!"
        passwordRequirementStackHeightConstraint?.constant = 30
        checkmarkImageView?.isHidden = true
        passwordRequirementLabel?.textColor = .red
    }
}
