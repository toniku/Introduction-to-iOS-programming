//
//  ViewController.swift
//  Lab2.3
//
//  Created by Toni K on 10/09/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var greeting = ""

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var greetingTextView: UITextView!
    
    @IBAction func buttonEnglish(_ sender: Any) {
        greetingTextView.text = "Hello \(nameTextField.text!)"
        greeting = "Hello"
    }
    
    @IBAction func buttonSverige(_ sender: Any) {
        greetingTextView.text = "Hejjsan \(nameTextField.text!)"
        greeting = "Hejjsan"
    }
    
    @IBAction func buttonSuomeksi(_ sender: Any) {
        greetingTextView.text = "Terve \(nameTextField.text!)"
        greeting = "Terve"
    }
    
    @IBAction func buttonSurprise(_ sender: Any) {
        greetingTextView.text = "Hola \(nameTextField.text!)"
        greeting = "Hola"
    }
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        greetingTextView.text = "\(greeting) \(nameTextField.text!)"
    }
}

extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
        
    }
}

