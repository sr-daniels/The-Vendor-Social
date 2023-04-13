//
//  CustomerSignUpViewController.swift
//  The Vendor Social
//
//  Created by Sharonda Daniels on 1/19/23.
//

import UIKit
import Parse

class CustomerSignUpViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var newPasswordRetypeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        // If all the information is valid, proceed
        if checkInputs(self) {
            
            // Log information in database
            let newUser = PFUser()
            
            newUser.username = emailAddressField.text
            newUser.password = newPasswordField.text
            newUser.setValue("customer", forKey: "accType")
            
            // Make new user for signing in
            newUser.signUpInBackground { (success: Bool, error: Error?) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Successfully logged!")
                    self.performSegue(withIdentifier: "signedUpC", sender: self)
                    
                    // Make new customer
                    let myNewCustomer = PFObject(className: "Customer")
                    myNewCustomer["firstName"] = self.firstNameField.text
                    myNewCustomer["lastName"] = self.lastNameField.text
                    myNewCustomer["email"] = self.emailAddressField.text
                    myNewCustomer.saveInBackground { (success, error) in
                        if (success) {
                            print("Object saved successfully.")
                        } else {
                            print("Error: \(error?.localizedDescription ?? "Unknown error")")
                        }
                    }
                    
                    
                }
            }
        }
    }
    func checkInputs(_ sender: Any) -> Bool{
        if (firstNameField.text == "" || lastNameField.text == "" || emailAddressField.text == "" || newPasswordField.text == "" || newPasswordRetypeField.text == "" || newPasswordField.text != newPasswordRetypeField.text) {
            return false
        } else {
            return true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
