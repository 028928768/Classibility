//
//  HistoryTableViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 4/12/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {
    //MARK: Properties
    var classes = [HisClass]()
    override func viewDidLoad() {
        super.viewDidLoad()

        loadHistoryClasses()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return classes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellidentifier = "historyCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifier, for: indexPath) as? HistoryTableViewCell else {
            fatalError("The dequeued cell is not an instance of HistoryTableViewCell")
        }
        
        //Fetch the appropriate data
        let his_class = classes[indexPath.row]
        
        cell.hisClassName.text = his_class.hisClassName
        cell.hisClassDate.text = his_class.hisClassDate
        cell.hisClassRoom.text = his_class.hisClassRoom
        cell.hisClassArrow.image = UIImage(named: "vectorIMG")

        

        return cell
    }
    
    //private Method
    private func loadHistoryClasses(){
        let VectorImage = UIImage(named: "vectorIMG")
        
        guard let class1 = HisClass(hisClassName: "EGCO464-Image Processing", hisClassDate: "Monday", hisClassRoom: "6274", hisClassArrow: VectorImage) else {
            fatalError("unable to load class1")
        }
        guard let class2 = HisClass(hisClassName: "EGCO428-Mobile Device", hisClassDate: "Tuesday", hisClassRoom: "6274", hisClassArrow: VectorImage) else {
            fatalError("unable to load class2")
        }
        guard let class3 = HisClass(hisClassName: "EGCO463-Pattern Recognition", hisClassDate: "Wednesday", hisClassRoom: "6274", hisClassArrow: VectorImage) else {
            fatalError("unable to load class3")
        }
        
        classes += [class1,class2,class3]
    }
    
    @IBAction func HomeMethod(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let RecordVC = segue.destination as? RecordTableViewController else {
            fatalError("Unexpected destination")
        }
        guard let selectedClassCell = sender as? HistoryTableViewCell else {
            fatalError("Unexpect selectedClass")
        }
        guard let indexPath = tableView.indexPath(for: selectedClassCell) else {
            fatalError("The selected cell is not being displayed by table")
        }
        let selectedClass = classes[indexPath.row]
        RecordVC.sentClass = selectedClass
    }
    

}
