//
//  ImageViewController.swift
//  Lab6.2
//
//  Created by Toni K on 13/10/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var getImageURL = String()

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (getImageURL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
