//
//  String+Extension.swift
//  Streamview
//
//  Created by Aya Mashaly on 04/04/2025.
//

import Foundation
import UIKit

extension String {
    func size(withFont font: UIFont) -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: attributes)
        return CGSize(width: ceil(size.width), height: ceil(size.height))
    }
}
