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
            question: "Start on Green Flag block is used to",
            answers: ["start the script when the green flag is tapped", "start the script when you tap on the character", "send a message of a specified color"],
            correctAnswer: 1),
        Question(
            question: "Start on Tap block",
            answers: ["starts the script when the character is touched by another character", "starts the script when you tap on the character", "starts the script when the green flag is tapped"],
            correctAnswer: 2)
        ]

    
    @IBOutlet weak var lblQuestion: UITextView!
    
    
    @IBOutlet weak var lblNext: UILabel!
    
    
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
            performSegue(withIdentifier: "ShowResults", sender: nil)
        }
    }
    
    func displayQuestion()
    {
        lblQuestion.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        lblNext.text = "\(currentQuestionPos + 1) / \(questions.count)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if(segue.identifier == "ShowResults") {
            var vc = segue.destination as! ResultViewController
            vc.numOfCorrectAns = numOfCorrectAns
            vc.total = questions.count
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currentQuestion = questions[0]
        displayQuestion()
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
