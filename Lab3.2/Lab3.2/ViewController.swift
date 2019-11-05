//
//  ViewController.swift
//  Lab3.2
//
//  Created by Toni K on 12/09/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFieldHttpAddress: UITextField!
    @IBOutlet weak var textFieldEmailAddress: UITextField!
    @IBOutlet weak var textFieldPhoneNumber: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonOpenBrowser(_ sender: Any) {
        let url = URL(string: textFieldHttpAddress.text!)
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url!)
        }
        print(url!)
    }
    
    @IBAction func buttonCreateCall(_ sender: Any) {
        let number = URL(string: "tel://" + textFieldPhoneNumber.text!)
        UIApplication.shared.open(number!)
        print(number!)
    }
    
    @IBAction func buttonSendEmail(_ sender: Any) {
        let email = textFieldEmailAddress.text!
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        print(email)
    }
    
    @IBAction func buttonOpenCamera(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        present(vc, animated: true)
    }
}

