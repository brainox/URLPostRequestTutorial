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
    }
    
    
}

