//
//  SoundViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-07-18.
//

import UIKit

class SoundViewController: UIViewController {

    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    var questions: [Question] = [
        Question(
            question: "1) 'Pop' block is used to:",
            answers: ["a) Play a sound recorded by the user.", "b) Start the script when you tap on the character.", "c) Play a 'Pop' Sound."],
            correctAnswer: 2),
        Question(
            question: "2) 'Play Recorded Sound' block is used to:",
            answers: ["a) Play a sound recorded by the user.", "b) Start the script when you tap on the character.", "c) Play a 'Pop' Sound."],
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
            performSegue(withIdentifier: "ShowResultsSound", sender: nil)
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
        if(segue.identifier == "ShowResultsSound") {
            if let vc = segue.destination as? ResultSoundViewController {
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
