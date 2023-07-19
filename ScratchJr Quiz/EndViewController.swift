//
//  EndViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-07-19.
//

import UIKit

class EndViewController: UIViewController {

    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    var questions: [Question] = [
        Question(
            question: "1) 'End' block is used to:",
            answers: ["a) Change to the specified page of the project.", "b) Run the script over and over.", "c) Indicate the end of the script (but does not affect the script in any way)."],
            correctAnswer: 2),
        Question(
            question: "2) 'Repeat Forever' block is used to:",
            answers: ["a) Indicate the end of the script (but does not affect the script in any way).", "b) Run the script over and over.", "c) Change to the specified page of the project."],
            correctAnswer: 1),
        Question(
            question: "3) 'Go To Page' block is used to:",
            answers: ["a) Change to the specified page of the project.", "b) Indicate the end of the script (but does not affect the script in any way).", "c) Run the script over and over."],
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
            performSegue(withIdentifier: "ShowResultsEnd", sender: nil)
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
        if(segue.identifier == "ShowResultsEnd") {
            if let vc = segue.destination as? ResultEndViewController {
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
