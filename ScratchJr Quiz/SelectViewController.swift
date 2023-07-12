//
//  Select ViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-06-15.
//

import UIKit

class SelectViewController: UIViewController {
    
    var text: String?
    
    @IBOutlet weak var displayUserName: UILabel!

    
    override func viewDidLoad() {
            
            if let receivedText = text {
                displayUserName.text = receivedText
            }
        }
}
