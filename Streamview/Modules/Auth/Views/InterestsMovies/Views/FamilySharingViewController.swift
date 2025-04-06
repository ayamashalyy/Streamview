//
//  FamilySharingViewController.swift
//  Streamview
//
//  Created by Aya Mashaly on 03/04/2025.
//

import UIKit

class FamilySharingViewController: UIViewController, Coordinating {
    
    @IBOutlet weak var backgroundImageView: UIImageView?
    @IBOutlet weak var scrollView: UIScrollView!
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
    }
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        coordinator?.eventOccurred(with: .profileCreated)
    }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        
        
    }
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        gradientLayer.colors = [
            UIColor.white.withAlphaComponent(0.0).cgColor,
            UIColor.white.withAlphaComponent(0.3).cgColor,
            UIColor.white.withAlphaComponent(0.8).cgColor,
            UIColor.white.withAlphaComponent(1.0).cgColor
            
        ]
        
        gradientLayer.locations = [0.0, 0.1856, 0.3636, 0.6694]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
        if let backgroundImageView = backgroundImageView {
            backgroundImageView.layer.addSublayer(gradientLayer)
        }
    }
}
