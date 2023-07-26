//
//  ControlViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-07-19.
//

import UIKit

class ControlViewController: UIViewController {

    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    var questions: [Question] = [
        Question(
            question: "1) 'Wait' block is used to:",
            answers: ["a) Pause the script for a specified amount of time (in tenths of seconds).", "b) Stop all the characters' scripts.", "c) Change the rate at which certain blocks are run."],
            correctAnswer: 0),
        Question(
            question: "2) 'Stop' block is used to:",
            answers: ["a) Run the blocks inside a specified number of times.", "b) Stop all the characters' scripts.", "c) Pause the script for a specified amount of time (in tenths of seconds)."],
            correctAnswer: 1),
        Question(
            question: "3) 'Set Speed' block is used to:",
            answers: ["a) Pause the script for a specified amount of time (in tenths of seconds).", "b) Run the blocks inside a specified number of times.", "c) Change the rate at which certain blocks are run."],
            correctAnswer: 2),
        Question(
            question: "4) 'Repeat' block is used to:",
            answers: ["a) Run the blocks inside a specified number of times.", "b) Stop all the characters' scripts.", "c) Change the rate at which certain blocks are run."],
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
            performSegue(withIdentifier: "ShowResultsControl", sender: nil)
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
        if(segue.identifier == "ShowResultsControl") {
            if let vc = segue.destination as? ResultControlViewController {
                vc.numOfCorrectAns = numOfCorrectAns
                vc.total = questions.count
            } else {
                // a warning
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
