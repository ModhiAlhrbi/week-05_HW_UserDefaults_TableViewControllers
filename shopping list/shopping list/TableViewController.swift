//
//  TableViewController.swift
//  shopping list
//
//  Created by موضي الحربي on 26/03/1443 AH.
//

import UIKit

class TableViewController: UITableViewController {
    
    var ShoppingList = ["Apples","Oranges","Mangos","pears"]
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedArray = defaults.array(forKey: "ShoppingList") as? [String]{
                ShoppingList = savedArray
           }
    

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.        // self.navigationItem.rightBarButtonItem = self.editButtonItem
   
    }
    
    @IBAction func Add(_ sender: UIBarButtonItem) {
        //getting an instance of UIAlertController
        let alert = UIAlertController(title: "What's your name?", message: nil, preferredStyle: .alert)
        
        //Adding Cancel Button
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        //adding a text field
        alert.addTextField(configurationHandler: { textField in
         textField.placeholder = "Input your name here..."
        })
        
        //adding an action "O.K."
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

          if let name = alert.textFields?.first?.text {
             print("Your name: \(name)")
              self.ShoppingList.append(name)
              self.tableView.reloadData()
              self.defaults.set(self.ShoppingList ,forKey: "ShoppingList")
          
          
          }
            
            
            
       }))

      self.present(alert, animated: true)

    }
    
    
    
    
    
    
    // MARK: - Table view data source

override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    return ShoppingList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
    tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
    cell.textLabel?.text = ShoppingList[indexPath.row]
    return cell
    
}
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            ShoppingList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with:.automatic)
        
            self.defaults.set(self.ShoppingList ,forKey: "ShoppingList")
            
            
        } }




    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        if sourceIndexPath == destinationIndexPath {
            return
        }else{
            
            
            let addShoppingList = ShoppingList [sourceIndexPath.row]
            ShoppingList.remove(at: sourceIndexPath.row)
            ShoppingList.insert(addShoppingList, at: destinationIndexPath.row)
            
        
        
        
        }
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

