//
//  ContainerPageVC.swift
//  Streamview
//
//  Created by Aya Mashaly on 22/02/2025.
//

import UIKit

// MARK: - ContainerPageVC
class ContainerPageVC: UIPageViewController {
    
    private var arrContainers: [OnboardingViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupOnboardingScreens()
        self.dataSource = self
        if let firstVC = arrContainers.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func setupOnboardingScreens() {
        for data in OnboardingData.onboardingScreens {
            let vc = OnboardingViewController(nibName: "OnboardingViewController", bundle: nil)
            // pass data to every screen
            vc.onboardingData = data
            arrContainers.append(vc)
        }
    }
}


// MARK: - Extention ContainerPageVC

extension ContainerPageVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // Find the index of viewController in arrContainers
        guard let currentIndex = arrContainers.firstIndex(of: viewController as! OnboardingViewController) else { return nil }
        
        // Calculate the previous index
        let previousIndex = currentIndex - 1
        
        // Ensure previousIndex is within bounds
        guard previousIndex >= 0 else { return arrContainers.last }
        
        // Return the previous view controller
        return arrContainers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // Find the index of exit viewController in arrContainers
        guard let currentIndex = arrContainers.firstIndex(of: viewController as! OnboardingViewController) else { return nil }
        
        // Calculate the after index
        let afterIndex = currentIndex + 1
        
        // Ensure afterIndex is within bounds
        guard afterIndex < arrContainers.count else { return arrContainers.first}
        
        // Return the after view controller
        return arrContainers[afterIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrContainers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        // start first index in arrContainers
        return 0
    }
}
