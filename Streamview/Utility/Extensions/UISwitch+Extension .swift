//
//  UISwitch+Extension.swift
//  Streamview
//
//  Created by Aya Mashaly on 03/04/2025.
//

import Foundation
import UIKit

extension UISwitch {
    func setOffTintColor(_ color: UIColor?) {
        if !self.isOn {
            self.backgroundColor = color
            self.layer.cornerRadius = 16
        }
    }
}
