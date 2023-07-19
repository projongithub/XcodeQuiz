//
//  ViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-06-15.
//

import UIKit

class HomeViewController: UIViewController {
    // try to implement a function that hides the keyboard when the user taps outside of the textfield, that way they won't be stuck on a real phone

	// try to hide the white lines on the sides, probably could be done with constraints

    @IBOutlet weak var typeUserName: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let receiverVC = segue.destination as? SelectViewController {

                if let text = typeUserName.text {
                    receiverVC.text = text
                }
            } else {
                // maybe insert a warning for the user here?
				// maybe the Alert item of UIKit can help you
            }
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}
