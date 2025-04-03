//
//  AuthValidator.swift
//  Streamview
//
//  Created by Aya Mashaly on 02/04/2025.
//

import Foundation


class AuthValidator {
    
    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
    static func isStaticEmail(_ email: String) -> Bool {
        let staticEmail = "aya@gmail.com"
        return email.lowercased() == staticEmail.lowercased()
    }
    
    static func isValidPassword(_ password: String) -> Bool {
        guard password.count >= 8 else { return false }
        
        let uppercasePattern = ".*[A-Z]+.*"
        let uppercasePredicate = NSPredicate(format: "SELF MATCHES %@", uppercasePattern)
        guard uppercasePredicate.evaluate(with: password) else { return false }
        
        let lowercasePattern = ".*[a-z]+.*"
        let lowercasePredicate = NSPredicate(format: "SELF MATCHES %@", lowercasePattern)
        guard lowercasePredicate.evaluate(with: password) else { return false }
        
        let specialCharacterPattern = ".*[!@#$%^&*()_+=]+.*"
        let specialCharacterPredicate = NSPredicate(format: "SELF MATCHES %@", specialCharacterPattern)
        guard specialCharacterPredicate.evaluate(with: password) else { return false }
        return true
    }
    
    static func isStaticPassword(_ password: String) -> Bool {
        let staticPassword = "aya@2001"
        return password.lowercased() == staticPassword.lowercased()
    }
    
    static func isValidOTP(_ otp: String) -> Bool {
        let staticOTP = "1234"
        return otp == staticOTP
    }
    
    static func isValidBirthday(_ birthday: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: birthday) != nil
    }
}
