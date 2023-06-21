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
		if let receiverVC = segue.destination as? SelectViewController {

			if let text = typeUserName.text {
				receiverVC.text = text
			}
		} else {
			// maybe insert a warning for the user here?
		}
    }
}
