//
//  ViewController.swift
//  Lab2.2
//
//  Created by Toni K on 10/09/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var counterText: UIButton!
    var clickCounter = 0

    @IBAction func buttonClick(_ sender: UIButton) {
        clickCounter += 1
        counterText.setTitle("You have pressed the button \(clickCounter) times", for: .normal)
    }
    
}
