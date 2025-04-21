//
//  ChooseInterestsViewController+UICollectionViewDelegate .swift
//  Streamview
//
//  Created by Aya Mashaly on 03/04/2025.
//

import Foundation
import UIKit

extension ChooseInterestsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfInterests
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesInterestsCell", for: indexPath) as? CategoriesInterestsCell else {
            return UICollectionViewCell()
        }
        let interest = viewModel.interests[indexPath.item]
        cell.categoryLabel?.text = interest.title
        cell.categoryImageView?.image = interest.image
        
        let isSelected = selectedInterests.contains(interest.title)
        cell.categoryLabel?.textColor = isSelected ? UIColor(named: "AppPrimaryColor") : UIColor.black
        cell.categoryImageView?.image = isSelected ? UIImage(named: "check") : UIImage(named: "dot")
        cell.layer.cornerRadius = 15
        cell.layer.borderWidth = 1
        cell.layer.borderColor = isSelected ? UIColor(named: "AppPrimaryColor")?.cgColor : UIColor(named: "ColorBorder")?.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let interest = viewModel.interests[indexPath.item].title
        if selectedInterests.contains(interest) {
            selectedInterests.removeAll { $0 == interest }
        } else {
            selectedInterests.append(interest)
        }
        
        collectionView.reloadItems(at: [indexPath])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interest = viewModel.interests[indexPath.item].title
        
        let font = UIFont.systemFont(ofSize: 14)
        let textSize = interest.size(withFont: font)
        let padding: CGFloat = 60
        let width = textSize.width + padding
        let height: CGFloat = 48
        return CGSize(width: min(max(width, 100), 209), height: height)
    }
}
