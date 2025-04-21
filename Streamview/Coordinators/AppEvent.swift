//
//  AppEvent.swift
//  Streamview
//
//  Created by Aya Mashaly on 06/04/2025.
//

import Foundation

protocol AppEvent {}

enum OnboardingEvent: AppEvent {
    case didFinishSplash
    case didCompleteOnboarding
}


enum AuthNavigationEvent: AppEvent {
    case didTapSignIn
    case didLoginSuccessfully
    case didTapForgotPassword
    case didTapSignUp
    case didVerifyOTP
    case didVerifyEmail
    case didCompleteSignUp
}

enum ProfileEvent: AppEvent {
    case didTapCreatePin
    case didCreateProfile
}

enum SettingsEvent: AppEvent {
    case didTapFamilySharing
}

enum GeneralEvent: AppEvent {
    case didDismiss
}
