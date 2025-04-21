//
//  SplashScreenViewController.swift
//  Streamview
//
//  Created by Aya Mashaly on 21/02/2025.
//

import UIKit

class SplashScreenViewController: UIViewController, Coordinating {
    
    @IBOutlet weak var streamviewLabel: UILabel?
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "AppPrimaryColor")
        streamviewLabel?.font = UIFont(name: "PlusJakartaSans-Bold", size: 29.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.coordinator?.eventOccurred(with: OnboardingEvent.didFinishSplash)
        }
    }
}
