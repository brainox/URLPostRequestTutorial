//
//  ViewController.swift
//  URLPostRequestTutorial
//
//  Created by Decagon on 27/07/2021.
//

import UIKit

class ViewController: UIViewController {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendMessage(_ sender: Any) {
        let alertController = UIAlertController(title: "New Message", message: "Enter a new Message", preferredStyle: .alert)
        alertController.addTextField { textfield in
            textfield.placeholder = "Your message ..."
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Send", style: .default, handler: { action in
            guard let text = alertController.textFields?.first?.text else {
                print("No text is available");
                return
            }
        }))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
}

