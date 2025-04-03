//
//  UITextField+Extension .swift
//  Streamview
//
//  Created by Aya Mashaly on 19/03/2025.
//

import Foundation
import UIKit

@IBDesignable extension UITextField {
    
    // Allows you to set the color of the placeholder text
    @IBInspectable var placeholderColor: UIColor? {
        set {
            if let color = newValue {
                let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: color,
                    .font: font ?? UIFont.systemFont(ofSize: 17)
                ]
                attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: attributes)
            }
        }
        get {
            return attributedPlaceholder?.foregroundColor
        }
    }
    
    // Controls the font size of the placeholder text
    @IBInspectable var placeholderFontSize: CGFloat {
        set {
            if let currentPlaceholder = placeholder {
                let attributes: [NSAttributedString.Key: Any] = [
                    .foregroundColor: attributedPlaceholder?.foregroundColor ?? UIColor.gray,
                    .font: UIFont.systemFont(ofSize: newValue)
                ]
                attributedPlaceholder = NSAttributedString(string: currentPlaceholder, attributes: attributes)
            }
        }
        get {
            return attributedPlaceholder?.fontSize ?? 17
        }
    }
    
    // Adds an image (e.g., eye icon) to the right side of the text field, typically for password visibility toggle
    @IBInspectable var rightImage: UIImage? {
        get {
            return (rightView as? UIButton)?.image(for: .normal)
        }
        set {
            if let image = newValue {
                let button = UIButton(type: .custom)
                button.setImage(image, for: .normal)
                button.tintColor = .black
                button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
                button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
                let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
                button.frame.origin.x = -5
                paddingView.addSubview(button)
                rightView = paddingView
                rightViewMode = .always
                isSecureTextEntry = true // Starts as secure (hidden text)
            } else {
                rightView = nil
                isSecureTextEntry = false // Resets to visible text when image is removed
            }
        }
    }
    
    // Toggles the visibility of the text (secure or plain) and updates the right image accordingly
    @objc private func togglePasswordVisibility() {
        isSecureTextEntry.toggle()
        if let paddingView = rightView,
           let button = paddingView.subviews.first as? UIButton {
            let imageName = isSecureTextEntry ? "eye.slash" : "eye"
            button.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }
    
    // Adds padding (empty space) to the left side of the text field, adjustable via Interface Builder or code
    @IBInspectable var leftPadding: CGFloat {
        get {
            return leftView?.frame.width ?? 0
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
}

extension NSAttributedString {
    // Helper to get the foreground color of the attributed string (used for placeholderColor)
    var foregroundColor: UIColor? {
        return attributes(at: 0, effectiveRange: nil)[.foregroundColor] as? UIColor
    }
    
    // Helper to get the font size of the attributed string (used for placeholderFontSize)
    var fontSize: CGFloat? {
        return (attributes(at: 0, effectiveRange: nil)[.font] as? UIFont)?.pointSize
    }
}
