//
//  ResultViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-06-19.
//

import UIKit

class ResultViewController: UIViewController {

    var numOfCorrectAns = 0
    var total = 0
    
    @IBOutlet weak var lblPerformance: UILabel!
    
    @IBOutlet weak var lblResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblResults.text = "You got \(numOfCorrectAns) out of \(total) correct"
        var percentRight = Double(numOfCorrectAns) / Double(total)
        percentRight *= 100
        var performance = ""
        if(percentRight < 40) {
            performance = "You need improvement"
        } else if(percentRight < 70) {
            performance = "Your performance was almost good !"
        } else {
            performance = "You did a Great Job !"
        }
        lblPerformance.text = performance
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
