//
//  OTPViewController.swift
//  Streamview
//
//  Created by Aya Mashaly on 26/03/2025.
//

import UIKit

class OTPViewController: UIViewController, Coordinating {
    
    @IBOutlet weak var emailLabel: UILabel?
    @IBOutlet weak var otpTextField1: UITextField?
    @IBOutlet weak var otpTextField2: UITextField?
    @IBOutlet weak var otpTextField3: UITextField?
    @IBOutlet weak var otpTextField4: UITextField?
    @IBOutlet weak var continueButton: UIButton?
    @IBOutlet weak var resendCodeButton: UIButton?
    var coordinator:  Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
    }
    private func setupTextFields() {
        otpTextField1?.delegate = self
        otpTextField2?.delegate = self
        otpTextField3?.delegate = self
        otpTextField4?.delegate = self
        
        otpTextField1?.keyboardType = .numberPad
        otpTextField2?.keyboardType = .numberPad
        otpTextField3?.keyboardType = .numberPad
        otpTextField4?.keyboardType = .numberPad
        
        otpTextField1?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        otpTextField2?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        otpTextField3?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        otpTextField4?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        let otp1 = otpTextField1?.text ?? ""
        let otp2 = otpTextField2?.text ?? ""
        let otp3 = otpTextField3?.text ?? ""
        let otp4 = otpTextField4?.text ?? ""
        let enteredOTP = "\(otp1)\(otp2)\(otp3)\(otp4)"
        
        if otp1.isEmpty || otp2.isEmpty || otp3.isEmpty || otp4.isEmpty {
            showAlert(message: "Please enter all the digits.")
        } else if AuthValidator.isValidOTP(enteredOTP) {
            showSuccessAlert(message: "OTP validated successfully!") {
                self.coordinator?.eventOccurred(with: .otpVerified)
            }
        } else {
            showFailureAlert(message: "The OTP is incorrect, please try again.")
        }
    }
    
    
    @IBAction func resendCodeTapped(_ sender: UIButton) {
        print("Resend Code tapped")
    }
    
    @IBAction func dismissScreen(_ sender: UIBarButtonItem) {
        coordinator?.eventOccurred(with: .dismiss)
    }
}
