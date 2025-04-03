//
//  ChooseInterestsViewController.swift
//  Streamview
//
//  Created by Aya Mashaly on 03/04/2025.
//

import UIKit

class ChooseInterestsViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField?
    @IBOutlet weak var filterButton: UIButton?
    @IBOutlet weak var interestsCollectionView: UICollectionView?
    @IBOutlet weak var nextButton: UIButton?
    let viewModel = ChooseInterestsViewModel()
    var selectedInterests: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        interestsCollectionView?.delegate = self
        interestsCollectionView?.dataSource = self
        interestsCollectionView?.register(UINib(nibName: "CategoriesInterestsCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesInterestsCell")
        
        if let layout = interestsCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 10
            layout.minimumInteritemSpacing = 10
            layout.invalidateLayout()
        }
    }
    
    @IBAction func filterButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        
        
    }
}
