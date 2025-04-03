//
//  ChooseInterestsViewModel.swift
//  Streamview
//
//  Created by Aya Mashaly on 03/04/2025.
//

import Foundation
import UIKit

struct Interests {
    let image: UIImage
    let title: String
}

class ChooseInterestsViewModel {
    
    private(set) var interests: [Interests] = [
        Interests(image: UIImage(named: "dot") ?? UIImage(), title: "Romance"),
        Interests(image: UIImage(named: "dot") ?? UIImage(), title: "Animation"),
        Interests(image: UIImage(named: "dot") ?? UIImage(), title: "Thriller"),
        Interests(image: UIImage(named: "dot") ?? UIImage(), title: "Adventure"),
        Interests(image: UIImage(named: "dot") ?? UIImage(), title: "Horror"),
        Interests(image: UIImage(named: "dot") ?? UIImage(), title: "Action"),
        Interests(image: UIImage(named: "dot") ?? UIImage(), title: "Drama"),
        Interests(image: UIImage(named: "dot") ?? UIImage(), title: "Mystery"),
        Interests(image: UIImage(named: "dot") ?? UIImage(), title: "Crime"),
        Interests(image: UIImage(named: "dot") ?? UIImage(), title: "Sci-fi")
    ]
    
    var numberOfInterests: Int {
        return interests.count
    }
    
}
