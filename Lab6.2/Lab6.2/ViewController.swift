//
//  ViewController.swift
//  Lab6.2
//
//  Created by Toni K on 13/10/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit
import SVProgressHUD

class TableViewController: UITableViewController {
    
    
    
    @IBOutlet var imageTableView: UITableView!
    var imageURLs = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show(withStatus: "Loading images")
        SVProgressHUD.dismiss(withDelay: 2)
        imageURLs = [
            "https://images.pexels.com/photos/416135/pexels-photo-416135.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://images.pexels.com/photos/2071882/pexels-photo-2071882.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://images.pexels.com/photos/208984/pexels-photo-208984.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://images.pexels.com/photos/69932/tabby-cat-close-up-portrait-69932.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://images.pexels.com/photos/68594/pexels-photo-68594.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://images.pexels.com/photos/416135/pexels-photo-416135.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://images.pexels.com/photos/2071882/pexels-photo-2071882.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://images.pexels.com/photos/208984/pexels-photo-208984.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://images.pexels.com/photos/69932/tabby-cat-close-up-portrait-69932.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "https://images.pexels.com/photos/68594/pexels-photo-68594.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let imageView = cell?.viewWithTag(1) as! UIImageView
        imageView.sd_setImage(with: URL(string: imageURLs[indexPath.row]), placeholderImage: #imageLiteral(resourceName: "72402.jpg"), options: [.continueInBackground, .progressiveLoad])
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "img", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ImageViewController
        vc.getImageURL = imageURLs[(imageTableView.indexPathForSelectedRow?.row)!]
        //imageTableView.deselectRow(at: <#T##IndexPath#>, animated: <#T##Bool#>)
    }
    
    


}

