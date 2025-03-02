//
//  ContainerPageVC.swift
//  Streamview
//
//  Created by Aya Mashaly on 22/02/2025.
//

import UIKit
import CHIPageControl

// MARK: - ContainerPageVC
class ContainerPageVC: UIPageViewController {
    
    private var arrContainers: [OnboardingViewController] = []
    private let pageControl =  CHIPageControlJaloro()
    private var signInButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupOnboardingScreens()
        self.dataSource = self
        self.delegate = self
        if let firstVC = arrContainers.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
        setupPageControl()
        setupSignInButton()
    }
    
    private func setupOnboardingScreens() {
        for data in OnboardingData.onboardingScreens {
            let vc = OnboardingViewController(nibName: "OnboardingViewController", bundle: nil)
            // pass data to every screen
            vc.onboardingData = data
            vc.delegate = self
            arrContainers.append(vc)
        }
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = arrContainers.count
        pageControl.tintColor = .lightGray
        pageControl.currentPageTintColor = UIColor(named: "AppPrimaryColor") ?? .purple
        pageControl.radius = 3
        pageControl.padding = 6
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setupSignInButton() {
        signInButton = UIButton(type: .system)
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.setTitleColor(UIColor(named: "OnboardingDescColor"), for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Mulish-SemiBold", size: 16)
        signInButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        signInButton.isHidden = true
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            signInButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc private func startButtonTapped() {
        print("Welcome")
        UserDefaults.standard.set(true, forKey: "onboarded")
        let mainVC = LoginViewController()
            let navController = UINavigationController(rootViewController: mainVC)
            navController.modalPresentationStyle = .fullScreen
            present(navController, animated: true, completion: nil)
    }
}


// MARK: - Extention ContainerPageVC

extension ContainerPageVC: UIPageViewControllerDataSource, UIPageViewControllerDelegate, OnboardingView {
    
    // MARK: - UIPageViewControllerDataSource Funs
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed,
              let currentVC = viewControllers?.first as? OnboardingViewController,
              let index = arrContainers.firstIndex(of: currentVC)
        else { return }
        
        DispatchQueue.main.async {
            self.pageControl.set(progress: index, animated: true)
            let isLastPage = (index == self.arrContainers.count - 1)
            self.pageControl.isHidden = isLastPage
            self.signInButton.isHidden = !isLastPage
        }
    }
    
    
    // MARK: - UIPageViewControllerDataSource Funs
    
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
    
    // MARK: - OnboardingViewControllerDelegate
    func didTapNextButton() {
        moveToNextPage()
    }
    
    func moveToNextPage() {
        guard let currentVC = viewControllers?.first as? OnboardingViewController,
              let currentIndex = arrContainers.firstIndex(of: currentVC) else { return }
        
        let nextIndex = currentIndex + 1
        guard nextIndex < arrContainers.count else { return }
        
        setViewControllers([arrContainers[nextIndex]], direction: .forward, animated: true, completion: nil)
        
        pageControl.set(progress: nextIndex, animated: true)
        let isLastPage = (nextIndex == arrContainers.count - 1)
        self.pageControl.isHidden = isLastPage
        self.signInButton.isHidden = !isLastPage
    }
}
