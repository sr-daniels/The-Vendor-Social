//
//  LoginViewController.swift
//  The Vendor Social
//
//  Created by Sharonda Daniels on 1/19/23.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onSignIn(_ sender: Any) {
        let email = emailAddressField.text!
        let password = passwordField.text!
        
        // Import Parse
        PFUser.logInWithUsername(inBackground: email, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "signedIn", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription ?? "none")")
            }
        }
        
        
    }
    
    @IBAction func onSignup(_ sender: Any) {
        // Import Parse
        /*
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground{(success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print ("Error: \(error?.localizedDescription ?? "none")")
            }
        }*/
    }

}
