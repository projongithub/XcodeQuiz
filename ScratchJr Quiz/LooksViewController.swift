//
//  LooksViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-07-18.
//

import UIKit

class LooksViewController: UIViewController {
    
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    var questions: [Question] = [
        Question(
            question: "1) 'Say' block is used to:",
            answers: ["a) Show a specified message in a speech bubble above the character.", "b) Increase the character's size.", "c) Decrease the character's size."],
            correctAnswer: 0),
        Question(
            question: "2) 'Grow' block is used to:",
            answers: ["a) Fade out the character until it is invisible.", "b) Increase the character's size.", "c) Return the character to its default size."],
            correctAnswer: 1),
        Question(
            question: "3) 'Shrink' block is used to:",
            answers: ["a) Decrease the character's size.", "b) Fade in the character until it is fully visible.", "c) Return the character to its default size."],
            correctAnswer: 0),
        Question(
            question: "4) 'Reset size' block is used to:",
            answers: ["a) Return the character to its default size.", "b) Show a specified message in a speech bubble above the character.", "c) Decrease the character's size."],
            correctAnswer: 0),
        Question(
            question: "5) 'Hide' block is used to:",
            answers: ["a) Return the character to its default size.", "b) Fade out the character until it is invisible.", "c) Decrease the character's size."],
            correctAnswer: 1),
        Question(
            question: "6) 'Show' block is used to:",
            answers: ["a) Increase the character's size.", "b) Fade out the character until it is invisible.", "c) Fade in the character until it is fully visible."],
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
            performSegue(withIdentifier: "ShowResultsLooks", sender: nil)
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
        if(segue.identifier == "ShowResultsLooks") {
            if let vc = segue.destination as? ResultLooksViewController {
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
