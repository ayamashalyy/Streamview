//
//  OnboardingViewController.swift
//  Streamview
//
//  Created by Aya Mashaly on 25/02/2025.
//

import UIKit

protocol OnboardingView: AnyObject {
    func didTapNextButton()
}

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var onboardingImage: UIImageView!
    @IBOutlet weak var onboardingTitle: UILabel!
    @IBOutlet weak var onboardingDescription: UILabel!
    @IBOutlet weak var onboardingButton: UIButton!
    var onboardingData: OnboardingData?
    weak var delegate: OnboardingView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configureViews()
    }
    
    private func setupViews() {
        onboardingTitle.font = UIFont(name: "Mulish-Bold", size: 20)
        onboardingDescription.font = UIFont(name: "Mulish-Regular", size: 14)
        onboardingImage.layer.cornerRadius = 20
        onboardingButton.backgroundColor = UIColor(named: "AppPrimaryColor")
        onboardingButton.setTitleColor(.white, for: .normal)
        onboardingButton.titleLabel?.font = UIFont(name: "Mulish-SemiBold", size: 16)
        onboardingButton.layer.cornerRadius = 24.0
    }
    
    private func configureViews() {
        guard let data = onboardingData else { return }
        onboardingImage.image = UIImage(named: data.imageName)
        onboardingTitle.text = data.title
        onboardingDescription.text = data.description
        onboardingButton.setTitle(data.buttonTitle, for: .normal)
    }
    
    @IBAction func onboardingButton(_ sender: UIButton) {
        delegate?.didTapNextButton()
    }
}
