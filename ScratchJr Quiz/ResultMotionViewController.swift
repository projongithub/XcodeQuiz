//
//  ResultMotionViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-07-14.
//

import UIKit

class ResultMotionViewController: UIViewController {

    var numOfCorrectAns = 0
    var total = 0
    
    @IBOutlet weak var lblPerformance: UILabel!
    
    @IBOutlet weak var lblResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        lblResults.text = "You got \(numOfCorrectAns) out of \(total) correct about"
        var percentRight = Double(numOfCorrectAns) / Double(total)
        percentRight *= 100
        var performance = ""
        if(percentRight < 40) {
            performance = "Need improvement"
        } else if(percentRight < 70) {
            performance = "Almost good !"
        } else {
            performance = "Great Job !!"
        }
        lblPerformance.text = performance
    }

}
