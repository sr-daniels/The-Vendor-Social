//
//  QuizPageViewController.swift
//  The Vendor Social
//
//  Created by Sharonda Daniels on 3/17/23.
//

import UIKit

class QuizPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var individualPageViewControllerList = [QuizQuestionViewController]()
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        self.dataSource = self
        self.delegate = self
        
        individualPageViewControllerList = [
            QuizQuestionViewController.getInstance(question: "What type of event are you planning?", answers: ["Wedding","Corporate","Small gathering (<30 people)","Other"]),
            QuizQuestionViewController.getInstance(question: "When would you like the event to be held?", answers: ["Spring","Summer","Fall","Winter"]),
            QuizQuestionViewController.getInstance(question: "Where would you like this event to take place?", answers: ["Indoor event venue","Restaurant","Any room will do","Outdoor event venue"])
        ]
        
        setViewControllers([individualPageViewControllerList[0]], direction: .forward, animated: true, completion: nil)
        
        

    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func goNext(){
        if (currentIndex != individualPageViewControllerList.count - 1){
            setViewControllers([individualPageViewControllerList[currentIndex + 1]], direction: .forward, animated: true, completion: nil)
            currentIndex += 1
        }
    }
    func goBack(){
        if (currentIndex != 0){
            setViewControllers([individualPageViewControllerList[currentIndex - 1]], direction: .reverse, animated: true, completion: nil)
            currentIndex -= 1
        }
    }
    /*
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = individualPageViewControllerList.firstIndex(of: viewController as! QuizQuestionViewController), index > 0 else {
            return nil
        }
        return individualPageViewControllerList[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = individualPageViewControllerList.firstIndex(of: viewController as! QuizQuestionViewController), index < individualPageViewControllerList.count - 1 else {
            return nil
        }
        return individualPageViewControllerList[index + 1]
    }*/
    /*
    private let pages = [UIViewController(), UIViewController(), UIViewController()]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.dataSource = self
            setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = pages.firstIndex(of: viewController), index > 0 else {
                return nil
            }
            return pages[index - 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else {
                return nil
            }
            return pages[index + 1]
        }*/
}
/*
struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: Int
}

let questions = [
    Question(text: "Question 1", answers: ["Answer 1", "Answer 2", "Answer 3"], correctAnswer: 1),
    Question(text: "Question 2", answers: ["Answer 1", "Answer 2", "Answer 3"], correctAnswer: 2),
    Question(text: "Question 3", answers: ["Answer 1", "Answer 2", "Answer 3"], correctAnswer: 0),
    // add more questions here
]
class QuizPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        <#code#>
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        <#code#>
    }
    
// Define an array to hold the quiz questions
    var quizQuestions: [String] = ["A", "B", "C"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the data source for the page view controller
        self.dataSource = self
        
        // Add the first quiz question view controller to the page view controller
        if let firstQuestion = quizQuestions.first {
            setViewControllers([firstQuestion.viewController], direction: .forward, animated: true, completion: nil)
        }
    }

}*/
