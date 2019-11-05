//
//  ContinentTableViewController.swift
//  Lab2.1
//
//  Created by Toni K on 09/09/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit

class ContinentTableViewController: UITableViewController {
    
    // Our data structure uses tuples.
    // Read more about it from here:
    // https://medium.com/@abhimuralidharan/tuble-in-swift-a9ddeb314c79
    
    let continents = [("Africa", Int64(1216130000)),
                      ("Australia", Int64(38304000)),
                      ("Antarctica", Int64(0)),
                      ("North America", Int64(579024000))]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Implement the dialog here by using UIAlertController
//        let continent = continents[indexPath.row].0
//        let population = continents[indexPath.row].1
        let alert = UIAlertController(title: continents[indexPath.row].0,
                    message: "Population of \(continents[indexPath.row].0) is \(continents[indexPath.row].1)",
                    preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    // Return number of sections in the table view here:
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Return the number of rows in section here:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = self.continents[indexPath.row].0
        return cell
    }
}
