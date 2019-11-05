//
//  ViewController.swift
//  Lab5.2
//
//  Created by Toni K on 25/09/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var notepadText: UITextView!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notepadText.delegate = self
        notepadText.text = defaults.string(forKey: "text_1")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        defaults.set(textView.text, forKey: "text_1")
    }

}

