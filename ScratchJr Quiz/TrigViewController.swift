//
//  Trig ViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-06-19.
//

import UIKit

class TrigViewController: UIViewController {
    
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    var questions: [Question] = [
        Question(
            question: "1) 'Start on Green Flag' block is used to:",
            answers: ["a) Start the script when the green flag is tapped.", "b) Start the script when you tap on the character.", "c) Start the script whenever a message of the specified color is sent."],
            correctAnswer: 0),
        Question(
            question: "2) 'Start on Tap' block is used to:",
            answers: ["a) Start the script when the character is touched by another character.", "b) Start the script when you tap on the character.", "c) Start the script when the green flag is tapped."],
            correctAnswer: 1),
        Question(
            question: "3) 'Start on Bump' block is used to:",
            answers: ["a) Start the script when you tap on the character.", "b) Start the script when the character is touched by another character.", "c) Send a message of a specified color."],
            correctAnswer: 1),
        Question(
            question: "4) 'Start on Message' block is used to:",
            answers: ["a) Start the script whenever a message of the specified color is sent.", "b) Send a message of a specified color.", "c) Starts the script when you tap on the character."],
            correctAnswer: 0),
        Question(
            question: "5) 'Send Message' block is used to:",
            answers: ["a) Start the script when the green flag is tapped.", "b) Starts the script when you tap on the character.", "c) Send a message of a specified color."],
            correctAnswer: 2)
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
        if(usersAns == currentQuestion?.correctAnswer)
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
            performSegue(withIdentifier: "ShowResults", sender: nil)
        }
    }
    
    func displayQuestion()
    {
        lblQuestion.text = currentQuestion?.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        lblProgress.text = "\(currentQuestionPos + 1) / \(questions.count) Questions"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "ShowResults") {
			if let vc = segue.destination as? ResultViewController {
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
