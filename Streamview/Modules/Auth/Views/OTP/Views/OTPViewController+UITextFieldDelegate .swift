//
//  OTPViewController+UITextFieldDelegate .swift
//  Streamview
//
//  Created by Aya Mashaly on 26/03/2025.
//

import Foundation
import UIKit


extension OTPViewController: UITextFieldDelegate {
    
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        let text = textField.text ?? ""
        if text.count == 1 {
            textField.layer.borderColor = UIColor.blue.cgColor
            switch textField {
            case otpTextField1:
                otpTextField2?.becomeFirstResponder()
            case otpTextField2:
                otpTextField3?.becomeFirstResponder()
            case otpTextField3:
                otpTextField4?.becomeFirstResponder()
            case otpTextField4:
                otpTextField4?.resignFirstResponder()
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
