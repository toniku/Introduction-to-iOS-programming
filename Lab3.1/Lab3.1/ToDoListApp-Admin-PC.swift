//
//  ToDoListApp.swift
//  Lab3.1
//
//  Created by Toni K on 12/09/2019.
//  Copyright © 2019 Toni K. All rights reserved.
//

import UIKit

class ToDoListApp: UITableViewController {
    
    var todo = [String] ()
    var newTodo: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        todo = ["Go to GYM","Do homework","Take the dog out"]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear ∂= false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newItemButton(_ sender: Any) {
        showTodoTextQueryDialog()
    }
    
    
    func showTodoTextQueryDialog() {
        var textInput: UITextField? = nil
        let alert = UIAlertController(title: "Add new", message: "Please enter text for the item", preferredStyle:
            UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Add", style: UIAlertActionStyle.default, handler: {_ in
            print("OK Button pressed: " + textInput!.text!)
            // This block is called when user clicks the OK button inside the dialog
            // You can get the text from the textInput object textInput?.text
            self.todo.append((textInput?.text)!)
            self.tableView.reloadData()
        }))
        alert.addTextField(configurationHandler: {(textField: UITextField!) in
            textField.placeholder = "ToDo Item"
            textInput = textField
            
        })
        self.present(alert, animated: true, completion: nil)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todo.count
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            self.todo.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            self.tableView.reloadData()
        
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoList", for: indexPath)

        cell.textLabel?.text = todo[indexPath.row]
        
        return cell
    }
}
