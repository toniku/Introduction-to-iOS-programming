//
//  ViewController.swift
//  Lab5.1
//
//  Created by Toni K on 24/09/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var timePicker: UIPickerView!
    var minutes:Int = 0
    var seconds:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // When users taps start timer button -> perform segue
    @IBAction func buttonStartTimer(_ sender: Any) {
        performSegue(withIdentifier: "time", sender: self)
    }
    
    // before moving to other view, we assign minutes and seconds to values in other class
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CountdownViewController
        vc.minutes = minutes
        vc.seconds = seconds
    }
    
    // Two columns in pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return "\(row) Minutes"
        }
        else {
            return "\(row) Seconds"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            minutes = row
        case 1:
            seconds = row
        default:
            break;
        }
    }
}

