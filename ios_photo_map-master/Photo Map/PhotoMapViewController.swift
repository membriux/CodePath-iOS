//
//  PhotoMapViewController.swift
//  Photo Map
//
//  Created by Nicholas Aiwazian on 10/15/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit
import MessageUI
import CoreLocation
import AddressBookUI


class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    let sfRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(37.783333, -122.416667),
                                      span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var selectedImage: UIImage!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.setRegion(sfRegion, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    @IBAction func onCameraButton(_ sender: Any) {
        self.selectPhoto()
        
    }
    
    
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
        Photos.selectedPhoto = editedImage
        dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "tagSegue", sender: nil)
    }

    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LocationsViewController {
            destination.delegate = self as? LocationsViewControllerDelegate
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
