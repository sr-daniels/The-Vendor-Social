//
//  VendorSignUpViewController.swift
//  The Vendor Social
//
//  Created by Sharonda Daniels on 1/19/23.
//

import UIKit
import Parse

class VendorSignUpViewController: UIViewController {

    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var companyNameField: UITextField!
    @IBOutlet weak var emailAddressField: UITextField!
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var newPasswordRetypeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        typeView.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        typeView.layer.borderWidth = 1.1
        
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        // If all the information is valid, proceed
        if checkInputs(self) {
            
            // Log information in database
            let newUser = PFUser()
            
            newUser.username = emailAddressField.text
            newUser.password = newPasswordField.text
            newUser.setValue("vendor", forKey: "accType")
            
            newUser.signUpInBackground { (success: Bool, error: Error?) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Successfully logged!")
                    self.performSegue(withIdentifier: "signedUpV", sender: self)
                    
                    // Make new vendor
                    let myNewVendor = PFObject(className: "Vendor")
                    myNewVendor["companyName"] = self.companyNameField.text
                    myNewVendor["email"] = self.emailAddressField.text
                    myNewVendor["category"] = self.categoryLabel.text
                    myNewVendor.saveInBackground { (success, error) in
                        if (success) {
                            print("Object saved successfully.")
                        } else {
                            print("Error: \(error?.localizedDescription ?? "Unknown error")")
                        }
                    }
                }
            }
            
            
            
            // Proceed to main screen
            
        }
    }
    
    func checkInputs(_ sender: Any) -> Bool{
        if (companyNameField.text == "" || emailAddressField.text == "" || newPasswordField.text == "" || newPasswordRetypeField.text == "" || newPasswordField.text != newPasswordRetypeField.text) {
            return false
        } else {
            return true
        }
    }
    
    @IBAction func venue(){
        categoryLabel.text = "Venue"
    }
    
    @IBAction func catering(){
        categoryLabel.text = "Catering"
    }
    
    @IBAction func photography(){
        categoryLabel.text = "Photography"
    }
    
    @IBAction func videography(){
        categoryLabel.text = "Videography"
    }
    
    @IBAction func transportation(){
        categoryLabel.text = "Transportation"
    }
    
    @IBAction func florist(){
        categoryLabel.text = "Florist"
    }
    
    @IBAction func wedding(){
        categoryLabel.text = "Wedding Coordinator"
    }
    
    @IBAction func eventPlanning(){
        categoryLabel.text = "Event Planning"
    }
    
    @IBAction func musician(){
        categoryLabel.text = "Musician"
    }
    
    @IBAction func band(){
        categoryLabel.text = "Band"
    }
    
    @IBAction func dj(){
        categoryLabel.text = "DJ"
    }
    
    @IBAction func bartender(){
        categoryLabel.text = "Bartender"
    }
    
    @IBAction func hairStylist(){
        categoryLabel.text = "Hair Stylist"
    }
    
    @IBAction func makeup(){
        categoryLabel.text = "Makeup Artist"
    }
    
    @IBAction func other(){
        categoryLabel.text = "Other"
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
