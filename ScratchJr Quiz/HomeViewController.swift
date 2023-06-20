//
//  ViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-06-15.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var typeUserName: UITextField!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiverVC = segue.destination as! SelectViewController
        
        if let text = typeUserName.text {
            receiverVC.text = text
        }
    }
}
