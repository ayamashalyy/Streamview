//
//  OnboardingData.swift
//  Streamview
//
//  Created by Aya Mashaly on 23/02/2025.
//

import Foundation

struct OnboardingData {
    let imageName: String
    let title: String
    let description: String
    let buttonTitle: String
    
    static let onboardingScreens: [OnboardingData] = [
        OnboardingData(imageName: "onboardingImage1",
                       title: "Watching can be from anywhere",
                       description: "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt",
                       buttonTitle: "Continue"),
        OnboardingData(imageName: "onboardingImage2",
                       title: "Complete list of movies",
                       description: "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt",
                       buttonTitle: "Continue"),
        OnboardingData(imageName: "onboardingImage1",
                       title: "Spent Time with Loved Ones!",
                       description: "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incididunt sed do eiusmod tempor incididunt",
                       buttonTitle: "Get Started")
    ]
    
}
