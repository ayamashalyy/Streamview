//
//  CreateProfileViewController.swift
//  Streamview
//
//  Created by Aya Mashaly on 03/04/2025.
//

import UIKit

class CreateProfileViewController: UIViewController, Coordinating {
    
    @IBOutlet weak var profileImageView: UIImageView?
    @IBOutlet weak var editButton: UIButton?
    @IBOutlet weak var profileNameTextField: UITextField?
    @IBOutlet weak var groupWatchSwitch: UISwitch?
    @IBOutlet weak var kidsProfileSwitch: UISwitch?
    @IBOutlet weak var createPinButton: UIButton?
    @IBOutlet weak var withoutPinButton: UIButton?
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kidsProfileSwitch?.setOffTintColor(.black)
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createPinTapped(_ sender: UIButton) {
        coordinator?.eventOccurred(with: .createPinTapped)
    }
    
    @IBAction func withoutPinTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func dismissScreen(_ sender: UIBarButtonItem) {
        coordinator?.eventOccurred(with: .dismiss)
    }
}


extension CreateProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[.editedImage] as? UIImage {
            profileImageView?.image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            profileImageView?.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
