//
//  Select ViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-06-15.
//

import UIKit

class SelectViewController: UIViewController {
    
    @IBOutlet weak var displayUsername: UILabel!
    var text: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if text != nil {
            displayUsername.text = text
        }
    }
    

}
