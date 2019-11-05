//
//  NameViewController.swift
//  Lab4.2
//
//  Created by Toni K on 18/09/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextView!
    @IBOutlet weak var greetImage: UIImageView!
    
    var nameText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = nameText
        if (nameText == "Veikko") {
            greetImage.image = UIImage(named: ("sunshine.jpg"))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
