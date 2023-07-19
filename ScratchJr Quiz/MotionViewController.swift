//
//  ViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-07-12.
//

    import UIKit

    class MotionViewController: UIViewController {
        
        struct Question {
            let question: String
            let answers: [String]
            let correctAnswer: Int
        }
        
        var questions: [Question] = [
            Question(
                question: "1) 'Move Right' block is used to:",
                answers: ["a) SMove the character up a specified number of grid squares and then down again.", "b) Move the character a specified number of grid squares to the right.", "c) Rotate the character clockwise a specified amount."],
                correctAnswer: 1),
            Question(
                question: "2) 'Move Left' block is used to:",
                answers: ["a) Move the character a specified number of grid squares to the left.", "b) Move the character up a specified number of grid squares and then down again.", "c) Reset the character's location to its starting position."],
                correctAnswer: 0),
            Question(
                question: "3) 'Move Up' block is used to:",
                answers: ["a) Reset the character's location to its starting position.", "b) Move the character a specified number of grid squares down.", "c) Move the character a specified number of grid squares up."],
                correctAnswer: 2),
            Question(
                question: "4) 'Move Down' block is used to:",
                answers: ["a) Move the character a specified number of grid squares down.", "b) Rotate the character counterclockwise a specified amount.", "c) Reset the character's location to its starting position"],
                correctAnswer: 0),
            Question(
                question: "5) 'Turn Right' block is used to:",
                answers: ["a) Rotate the character clockwise a specified amount.", "b) Move the character a specified number of grid squares up.", "c) Move the character a specified number of grid squares to the right."],
                correctAnswer: 0),
            Question(
                question: "6) 'Turn Left' block is used to:",
                answers: ["a) Reset the character's location to its starting position.", "b) Rotate the character counterclockwise a specified amount.", "c) Move the character a specified number of grid squares up."],
                correctAnswer: 1),
            Question(
                question: "7) 'Hop' block is used to:",
                answers: ["a) Move the character a specified number of grid squares to the left.", "b) Move the character a specified number of grid squares down.", "c) Move the character up a specified number of grid squares and then down again."],
                correctAnswer: 2),
            Question(
                question: "8) 'Go Home' block is used to:",
                answers: ["a) Reset the character's location to its starting position.", "b) Rotate the character clockwise a specified amount.", "c) Move the character a specified number of grid squares to the right."],
                correctAnswer: 0)
            ]

        
        @IBOutlet weak var lblQuestion: UILabel!
    
        
        @IBOutlet weak var lblProgress: UILabel!
        
        
        var currentQuestion: Question?
        var currentQuestionPos = 0
        var numOfCorrectAns = 0
        
        @IBOutlet weak var answer0: UIButton!

        @IBOutlet weak var answer1: UIButton!
        
        @IBOutlet weak var answer2: UIButton!
        
        @IBAction func option1(_ sender: UIButton)
        {
            checkAnswer(usersAns: 0)
        }
        
        @IBAction func option2(_ sender: UIButton)
        {
            checkAnswer(usersAns: 1)
        }
        
        @IBAction func option3(_ sender: UIButton)
        {
            checkAnswer(usersAns: 2)
        }
        
        func checkAnswer(usersAns: Int)
        {
            if(usersAns == currentQuestion!.correctAnswer)
            {
                numOfCorrectAns += 1
            }
            loadNextQuestion()
        }
        
        func loadNextQuestion()
        {
            if(currentQuestionPos + 1 < questions.count)
            {
                currentQuestionPos += 1
                currentQuestion = questions[currentQuestionPos]
                displayQuestion()
            }
            else
            {
                performSegue(withIdentifier: "ShowResultsMotion", sender: nil)
            }
        }
        
        func displayQuestion()
        {
            lblQuestion.text = currentQuestion!.question
            answer0.setTitle(currentQuestion!.answers[0], for: .normal)
            answer1.setTitle(currentQuestion!.answers[1], for: .normal)
            answer2.setTitle(currentQuestion!.answers[2], for: .normal)
            lblProgress.text = "\(currentQuestionPos + 1) / \(questions.count) Questions"
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if(segue.identifier == "ShowResultsMotion") {
                if let vc = segue.destination as? ResultMotionViewController {
                    vc.numOfCorrectAns = numOfCorrectAns
                    vc.total = questions.count
                } else {
                    // a warning for the user here
                }
            }
        }
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationItem.setHidesBackButton(true, animated: true)
            
            currentQuestion = questions[0]
            displayQuestion()
        }

    }
