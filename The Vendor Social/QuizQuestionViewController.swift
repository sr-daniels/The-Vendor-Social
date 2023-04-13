//
//  QuizQuestionViewController.swift
//  The Vendor Social
//
//  Created by Sharonda Daniels on 3/17/23.
//

import UIKit
class QuizQuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    var question:String = ""
    var answers:[String] = ["a","b","c","d"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.questionLabel.text = question
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: AnswerTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AnswerTableViewCell", for: indexPath) as! AnswerTableViewCell
        
        cell.answerLabel.text = answers[indexPath.row]

        
        return cell
    }
    
    static func getInstance(question: String, answers: [String]) -> QuizQuestionViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuizQuestionViewController") as! QuizQuestionViewController
        vc.question = question
        vc.answers = answers
        return vc
    }
    
}
    
    
    
    
    
    /*
     //WORKING WORKING
     
    
    @IBOutlet weak var questionContainer: QuestionContainerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func buttonPress(_ sender: Any) {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        
        // Animate view1 sliding out to the left
        UIView.animate(withDuration: 0.3, animations: {
            self.questionContainer.frame = CGRect(x: -screenWidth, y: 260, width: 240, height: 128)
        })
        
        // Animate the question container view sliding out to the left
        /*
            UIView.animate(withDuration: 0.3, animations: {
                self.questionContainer.frame = CGRect(x: -screenWidth, y: 165, width: screenWidth, height: screenHeight)
            }) { _ in
                // Optional completion handler for any necessary cleanup or additional actions after the animation
            }*/
        
    }
    
    
    
    
    
    */
    
    /*
    
    // define your question array and current question index variables
    var questions: [String] = ["a", "b", "c", "b", "c", "b", "c", "b", "c", "b", "c", "b", "c", "b", "c", "b", "c"]
    var currentQuestionIndex = 0
    
    // define your question label and "Next" button
    let questionLabel = UILabel()
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up your UI elements (e.g. question label, button)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionLabel)
        
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)
        
        // set up your layout constraints
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nextButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // load the first question
        loadQuestion()
    }
    
    // function to load the current question
    func loadQuestion() {
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        // increment the current question index
        currentQuestionIndex += 1
        
        // check if we've reached the end of the questions
        if currentQuestionIndex >= questions.count {
            // if we have, show the results or next screen as appropriate
            // for example:
            print("done")
            //let resultsViewController = ResultsViewController()
            //navigationController?.pushViewController(resultsViewController, animated: true)
        } else {
            // otherwise, animate the transition to the next question
            let nextQuestionLabel = UILabel() // create a new UILabel to display the next question
            nextQuestionLabel.text = questions[currentQuestionIndex] // set the text for the next question
            nextQuestionLabel.translatesAutoresizingMaskIntoConstraints = false // disable the default constraints
            view.addSubview(nextQuestionLabel) // add the new label to the view hierarchy
            

            // set up the constraints for the new label and the current label to slide out
            /*
            NSLayoutConstraint.activate([
                //nextQuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: view.bounds.width), // position the next label off-screen to the right
                nextQuestionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor), // center the next label vertically
                
                //questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -view.bounds.width), // slide the current label out to the left
                
            //nextButton.topAnchor.constraint(equalTo: nextQuestionLabel.bottomAnchor, constant: 20), // position the "Next" button below the next label
            ])*/


            // animate the transition between the two labels
            /*
            UIView.animate(withDuration: 0.5, animations: {
                self.questionLabel.center.x -= self.view.bounds.width // slide the current label to the left
                nextQuestionLabel.center.x -= self.view.bounds.width // slide the next label to the left
            }) { _ in
                self.questionLabel.text = nextQuestionLabel.text // set the text of the current label to the next question
                nextQuestionLabel.removeFromSuperview() // remove the next label from the view hierarchy
            }
            */
            
            UIView.animate(withDuration: 3) {
                // Get the current position of the label
                let currentPosition = self.questionLabel.frame.origin.x
                
                // Slide the label out to the left
                self.questionLabel.frame.origin.x = currentPosition - 10
            }
/*
            UIView.animate(withDuration: 0.5, animations: {
                
                self.questionLabel.center.x -= self.view.bounds.width // slide the current label to the left
                //nextQuestionLabel.center.x -= self.view.bounds.width // slide the next label to the left
            })
            /*) { _ in
                self.questionLabel.text = nextQuestionLabel.text // set the text of the current label to the next question
                nextQuestionLabel.removeFromSuperview() // remove the next label from the view hierarchy
            }
*/*/
            
            /*
            // otherwise, animate the transition to the next question
            let nextQuestionLabel = UILabel()
            nextQuestionLabel.text = questions[currentQuestionIndex]
            nextQuestionLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(nextQuestionLabel)
            
            NSLayoutConstraint.activate([
                nextQuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: view.bounds.width),
                nextQuestionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
                questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -view.bounds.width),
                
                nextButton.topAnchor.constraint(equalTo: nextQuestionLabel.bottomAnchor, constant: 20),
            ])
            
            UIView.animate(withDuration: 0.5, animations: {
                self.questionLabel.center.x -= self.view.bounds.width
                nextQuestionLabel.center.x -= self.view.bounds.width
            }) { _ in
                self.questionLabel.text = nextQuestionLabel.text
                nextQuestionLabel.removeFromSuperview()
            }*/
        }
    
    }
    
    
    
    
    
    // function to handle "Next" button taps
    @objc func nextButtonTapped() {
        // increment the current question index
        currentQuestionIndex += 1
        
        // check if we've reached the end of the questions
        if currentQuestionIndex >= questions.count {
            // if we have, show the results or next screen as appropriate
            // for example:
            print("done")
            //let resultsViewController = ResultsViewController()
            //navigationController?.pushViewController(resultsViewController, animated: true)
        } else {
            // otherwise, animate the transition to the next question
            let nextQuestionLabel = UILabel()
            nextQuestionLabel.text = questions[currentQuestionIndex]
            nextQuestionLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(nextQuestionLabel)
            
            NSLayoutConstraint.activate([
                nextQuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: view.bounds.width),
                nextQuestionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                
                questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -view.bounds.width),
                
                nextButton.topAnchor.constraint(equalTo: nextQuestionLabel.bottomAnchor, constant: 20),
            ])
            
            UIView.animate(withDuration: 0.5, animations: {
                self.questionLabel.center.x -= self.view.bounds.width
                nextQuestionLabel.center.x -= self.view.bounds.width
            }) { _ in
                self.questionLabel.text = nextQuestionLabel.text
                nextQuestionLabel.removeFromSuperview()
            }
        }
    }*/

    /*
    // Create an array of quiz questions
    let quizQuestions = ["Question 1", "Question 2", "Question 3"]
    
    // Keep track of the current question index
    var currentQuestionIndex = 0
    
    // Display the current question
    let currentQuestionLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    func currentQuestionLabel.text = quizQuestions[currentQuestionIndex]
    view.addSubview(currentQuestionLabel)
    
    // When the user clicks "Next", animate the transition to the next question
    let nextQuestionLabel = UILabel(frame: CGRect(x: view.bounds.width, y: 0, width: 200, height: 50))
    nextQuestionLabel.text = quizQuestions[currentQuestionIndex + 1]
    view.addSubview(nextQuestionLabel)
    
    UIView.animate(withDuration: 0.5, animations: {
        currentQuestionLabel.frame.origin.x = -view.bounds.width
        nextQuestionLabel.frame.origin.x = 0
    }) { _ in
        // Remove the current question view and update the current question index
        currentQuestionLabel.removeFromSuperview()
        currentQuestionIndex += 1
    }
}
    */
    /*
    var question: String?


    // array of questions
    var questions: [Question] = []
    
    // current question index
    var currentQuestionIndex = 0
    
    // page view controller
    var pageViewController: UIPageViewController!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set up the page view controller
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        // add the page view controller to the view
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        // set the first question view controller as the initial view controller
        let firstViewController = questionViewController(atIndex: currentQuestionIndex)
        pageViewController.setViewControllers([firstViewController], direction: .forward, animated: false, completion: nil)
    }
    
    // create a question view controller for a given question index
    func questionViewController(atIndex index: Int) -> QuizQuestionViewController {
        let questionViewController = storyboard?.instantiateViewController(withIdentifier: "QuizQuestionViewController") as! QuizQuestionViewController
        questionViewController.question = questions[index]
        return questionViewController
    }
    
}

extension QuizQuestionViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        // return the previous question view controller
        if let questionViewController = viewController as? QuizQuestionViewController, let index = questions.firstIndex(of: questionViewController.question), index > 0 {
            return questionViewController(atIndex: index - 1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        // return the next question view controller
        if let questionViewController = viewController as? QuizQuestionViewController, let index = questions.firstIndex(of: questionViewController.question), index < questions.count - 1 {
            return questionViewController(atIndex: index + 1)
        }
        return nil
    }
}

extension QuizQuestionViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let questionViewController = pageViewController.viewControllers?.first as? QuizQuestionViewController, let index = questions.firstIndex(of: questionViewController.question) {
            currentQuestionIndex = index
        }
    }
}

extension QuizQuestionViewController {
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // update the current question index
        currentQuestionIndex += 1
        
        // animate the transition to the next question
        let nextViewController = questionViewController(atIndex: currentQuestionIndex)
        pageViewController.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
    }
}


*/

    
    /*
    @IBOutlet weak var questionContainer: QuestionContainerView!
    var quizQuestions: [String] = ["What is your name?", "How can I help?"]
    @IBOutlet weak var quuestionLabel: UILabel!
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadQuestion()
    }
    func loadQuestion() {
        guard quizQuestions.count > 0 else {
            // Handle the case where there are no quiz questions
            return
        }
        quuestionLabel.text = quizQuestions[currentQuestionIndex]
        /*
        let quizQuestionView = quizQuestions[currentQuestionIndex].view
        quizQuestionView.translatesAutoresizingMaskIntoConstraints = false
        questionContainerView.addSubview(quizQuestionView)
        */
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        // Assume we have two views, view1 and view2, that we want to slide in/out
        // from the left and right, respectively
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height

        // Set the initial positions of the views
        //questionContainer.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        //view2.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        var view2 = QuestionContainerView()
        view2.backgroundColor = .red

        // Animate view1 sliding out to the left
        UIView.animate(withDuration: 0.3, animations: {
            self.questionContainer.frame = CGRect(x: -screenWidth, y: 165, width: screenWidth, height: screenHeight)
        })

        
        // Animate view2 sliding in from the right
        UIView.animate(withDuration: 0.5, animations: {
            view2.frame = CGRect(x: 0, y: 165, width: screenWidth, height: screenHeight)
        })

        
        currentQuestionIndex += 1
        loadQuestion()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */*/


