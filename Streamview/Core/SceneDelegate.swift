//
//  SceneDelegate.swift
//  Streamview
//
//  Created by Aya Mashaly on 21/02/2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Tries to cast scene as UIWindowScene.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Creates a new UIWindow and associates it with the current windowScene.
        window = UIWindow(windowScene: windowScene)
        
        // Sets the root view controller (the first screen shown when the app launches).
        let onboarded = UserDefaults.standard.bool(forKey: "onboarded")

        // Sets the root view controller (the first screen shown when the app launches).
        if onboarded {
                window?.rootViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
            } else {
                window?.rootViewController = SplashScreenViewController(nibName: "SplashScreenViewController", bundle: nil)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    let onboardingVC = ContainerPageVC()
                    self.window?.rootViewController = onboardingVC
                }
            }
        
        // Without this, even if you set the root view controller, the UI wouldn’t appear.
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

