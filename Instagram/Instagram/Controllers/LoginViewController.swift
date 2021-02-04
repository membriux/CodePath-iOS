//
//  LoginViewController.swift
//  Instagram
//
//  Created by Memo on 11/22/18.
//  Copyright © 2018 Membriux. All rights reserved.
//

import UIKit
import Parse
import MBProgressHUD

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // Alert controller initialization
    let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
    let dismissAction = UIAlertAction(title: "Dismiss", style: .default)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertController.addAction(dismissAction)
    

    }
    
    
    /*----- User login and Signup -----*/
    
    // Sign in
    @IBAction func onSignIn(_ sender: Any) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let username = usernameField.text!
        let password = passwordField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if (user != nil) {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                self.invalidLogin(error: error!)
            }
            
        }
        
    }
    
    
    // Signup
    @IBAction func onSignUp(_ sender: Any) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                self.invalidSignup(error: error!)
            }
        }
    }
    
    
    /*----- Error Handling -----*/
    
    // Alert user when there is an error during signup
    func invalidLogin(error: Error) {
        MBProgressHUD.hide(for: self.view, animated: true)
        alertController.title = "Login Error"
        alertController.message =  error.localizedDescription
        present(alertController, animated: true)
    }
    
    // Alert user when there is an error during signup
    func invalidSignup(error: Error) {
        MBProgressHUD.hide(for: self.view, animated: true)
        alertController.title = "Sign up Error"
        alertController.message =  error.localizedDescription
        present(alertController, animated: true)
    }
    

}
