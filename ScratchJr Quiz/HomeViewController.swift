//
//  ViewController.swift
//  ScratchJr Quiz
//
//  Created by P M on 2023-06-15.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var typeUserName: UITextField!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let controller = storyboard?.instantiateViewController(identifier: "SelectViewController") as! SelectViewController
        controller.text = typeUserName.text
        controller.modalPresentationStyle = .fullScreen
        present(controller,animated: true, completion: nil)
    }
    
     }

