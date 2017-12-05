//
//  TVC.swift
//  FoodRater
//
//  Created by Mobile on 11/17/17.
//  Copyright © 2017 Mobile. All rights reserved.
//

import UIKit

class TVC: UITableViewController {

    var data = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mealB = UIImage(named: "meal3.png")
        let mealA = UIImage(named: "meal1.png")
        data.append(Meal(name: "Pasta", rating: 4, image: mealB!)!)
        data.append(Meal(name: "Caprese Salad", rating: 2, image: mealA!)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zoop!", for: indexPath) as! CellTV

        cell.rate = self.data[indexPath.row].rating
        cell.foodImg.image = self.data[indexPath.row].image
        cell.name.text = self.data[indexPath.row].name
        //cell.foodImg = UIImage(named: "defaultPhoto.png")
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "food") as! ViewController
       
        self.navigationController?.pushViewController(detailVC, animated: true)
       // self.present(detailVC, animated: true, completion: nil)
    }
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let meal = sourceViewController.newMeal {
            
            // Add a new meal.
            let newIndexPath = IndexPath(row: data.count, section: 0)
            
            data.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    @IBAction func exiter(sender: UIStoryboardSegue) {
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
