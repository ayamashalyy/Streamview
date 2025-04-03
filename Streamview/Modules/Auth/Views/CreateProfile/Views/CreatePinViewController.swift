//
//  CreatePinViewController.swift
//  Streamview
//
//  Created by Aya Mashaly on 03/04/2025.
//

import UIKit

class CreatePinViewController: UIViewController {
    
    @IBOutlet weak var pinTextField1: UITextField?
    @IBOutlet weak var pinTextField2: UITextField?
    @IBOutlet weak var pinTextField3: UITextField?
    @IBOutlet weak var pinTextField4: UITextField?
    @IBOutlet weak var createPinButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pinTextField1?.delegate = self
        pinTextField2?.delegate = self
        pinTextField3?.delegate = self
        pinTextField4?.delegate = self
        
        pinTextField1?.keyboardType = .numberPad
        pinTextField2?.keyboardType = .numberPad
        pinTextField3?.keyboardType = .numberPad
        pinTextField4?.keyboardType = .numberPad
        
        pinTextField1?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        pinTextField2?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        pinTextField3?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        pinTextField4?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @IBAction func createPinButtonTapped(_ sender: UIButton) {
        let pin1 = pinTextField1?.text ?? ""
        let pin2 = pinTextField2?.text ?? ""
        let pin3 = pinTextField3?.text ?? ""
        let pin4 = pinTextField4?.text ?? ""
        let enteredOTP = "\(pin1)\(pin2)\(pin3)\(pin4)"
        
        guard !pin1.isEmpty, !pin2.isEmpty, !pin3.isEmpty, !pin4.isEmpty else {
            showAlert(message: "Please enter all the digits.")
            return
        }
        UserDefaults.standard.set(enteredOTP, forKey: "userPIN")
        showSuccessAlert(message: "PIN created successfully!") {
            let familySharingViewController = FamilySharingViewController()
            familySharingViewController.modalPresentationStyle = .fullScreen
            self.present(familySharingViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func dismissScreen(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}


extension CreatePinViewController: UITextFieldDelegate {
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text ?? ""
        if text.count == 1 {
            textField.layer.borderColor = UIColor.blue.cgColor
            switch textField {
            case pinTextField1:
                pinTextField2?.becomeFirstResponder()
            case pinTextField2:
                pinTextField3?.becomeFirstResponder()
            case pinTextField3:
                pinTextField4?.becomeFirstResponder()
            case pinTextField4:
                pinTextField4?.resignFirstResponder()
            default:
                break
            }
        } else {
            textField.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        let numbersOnly = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        guard characterSet.isSubset(of: numbersOnly) else { return false }
        return updatedText.count <= 1
    }
}
