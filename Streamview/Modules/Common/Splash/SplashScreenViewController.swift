//
//  SplashScreenViewController.swift
//  Streamview
//
//  Created by Aya Mashaly on 21/02/2025.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var streamviewLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "AppPrimaryColor")
        streamviewLabel.font = UIFont(name: "PlusJakartaSans-Bold", size: 29.0)
    }
}
