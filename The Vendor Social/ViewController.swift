//
//  ViewController.swift
//  The Vendor Social
//
//  Created by Sharonda Daniels on 12/31/22.
//


import UIKit

class ViewController: UIViewController {
    
    // Define an array of view controllers to display
    //let pages = [TestViewController(), TestViewController(), TestViewController()]
    @IBOutlet weak var pageControllerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the data source of the page view controller
        //dataSource = self
        
        // Set the initial view controller of the page view controller
        //setViewControllers([pages[0]], direction: .forward, animated: false, completion: nil)
        // Iterate through all child view controllers of the UIView
        print(children)
        






    }
    
    @IBAction func back(_ sender: Any) {
        
        for childViewController in children {
            print(childViewController)
            // Check if the child view controller is a page view controller
            if let pageViewController = childViewController as? QuizPageViewController {
                pageViewController.goBack()
            }
        }
    }
    @IBAction func next(_ sender: Any) {
         
         for childViewController in children {
             print(childViewController)
             // Check if the child view controller is a page view controller
             if let pageViewController = childViewController as? QuizPageViewController {
                 pageViewController.goNext()
             }
         }
         //pageControllerView.goNext()
         //pageControllerView.viewcon
         //pageControllerView as! QuizPageViewController
     }
    /*
     // Implement the data source methods
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController as! TestViewController), index > 0 else {
            return nil
        }
        
        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController as! TestViewController), index < pages.count - 1 else {
            return nil
        }
        
        return pages[index + 1]
    }*/
}
