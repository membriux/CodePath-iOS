//
//  ImagePickerViewController.swift
//  Instagram
//
//  Created by Memo on 12/8/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

/*----- Comment -----*/

import UIKit
import MBProgressHUD


class ImagePickerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var selectedPhotoImageView: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    
    // Alert controller initialization
    let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
    let dismissAction = UIAlertAction(title: "Dismiss", style: .default)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        selectPhoto()
        alertController.addAction(dismissAction)
        
    }
    
    
    /*----- UIButtons Functionality -----*/
    @IBAction func onSelectPhoto(_ sender: Any) {
        // Select New photo
        selectPhoto()
    }
    
    
    @IBAction func onSubmit(_ sender: Any) {
        // Submit Photo to Parse
        MBProgressHUD.showAdded(to: self.view, animated: true)
        guard let image = selectedPhotoImageView.image,
            let caption = captionField.text else {
                self.invalidPost()
                return
        }
    
        Post.postUserImage(image: image, withCaption: caption) { (success, error) in
            if success {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.success()
            } else {
                print(error.debugDescription)
                self.parseError(error: error!)
            }

        }
    }

    
    /*----- Image selection/handling + ImagePickerController -----*/
    
    func selectPhoto() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        // Present camera, if available
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        // Present photo library
        } else {
            imagePicker.sourceType = .photoLibrary
            // Present imagePicker source type (either camera or library)
        }
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let _ = info[.originalImage] as! UIImage
        let editedImage = info[.editedImage] as! UIImage
        selectedPhotoImageView.image = editedImage
        dismiss(animated: true, completion: nil)
    }

    
    
    // If post subumitted successfully
    func success() {
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = .customView
        hud.customView = UIImageView(image: UIImage(named: "Checkmark"))
        hud.label.text = "Submitted"
        self.captionField.text = ""
        self.selectedPhotoImageView.image = nil
        
        var runCount = 0
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            runCount += 1
            
            if runCount == 3 {
                timer.invalidate()
                hud.hide(animated: true)
            }
        }

    }
    
    
    /*----- Error Handling -----*/
    // Alert user to choose a photo
    func invalidPost() {
        MBProgressHUD.hide(for: self.view, animated: true)
        alertController.title = "Photo not chosen"
        alertController.message =  "Please choose a photo to create a new post."
        present(alertController, animated: true)
    }
    
    // Alert user when post wasn't saved
    func parseError (error: Error) {
        alertController.title = "Server Error"
        alertController.message = error.localizedDescription
        present(alertController, animated: true)
    }
    

}
