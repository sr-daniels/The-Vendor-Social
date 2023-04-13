//
//  QuizViewController.swift
//  The Vendor Social
//
//  Created by Sharonda Daniels on 3/17/23.
//

import UIKit

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func beginQuiz(_ sender: Any) {
        
        let nextViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NextViewController") as! ViewController
        nextViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nextViewController, animated: true)
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
