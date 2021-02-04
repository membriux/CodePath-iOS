//
//  ViewController.swift
//  Pictures
//
//  Created by Memo on 12/1/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import UIKit

class ChoosePhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var selectedPhotoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func buttonPressed(_ sender: Any) {
        print("pressed")
        self.selectPhoto()
    }
    
    
    // Instantiate Image Picker and set delegate to this view controller
    func selectPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        // Present camera, if available
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            imagePicker.sourceType = .camera
            
        // Present photo library
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            imagePicker.sourceType = .photoLibrary
        // Present imagePicker source type (either camera or library)
        }
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let _ = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        let editedImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        selectedPhotoImageView.image = editedImage
        dismiss(animated: true, completion: nil)
    }
    
    
}

