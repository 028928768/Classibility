//
//  ClassTableViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 3/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class ClassTableViewController: UITableViewController {
    //MARK: Properties
    var classes = [Class]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //load sampleClass
        loadSampleClass()
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
        let cellIdentifier = "subjectCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ClassTableViewCell else {
            fatalError("The dequeued cell is not an instance of ClassTableViewCell")
        }
        //Fetch data from datasource
        let class_display = classes[indexPath.row]
        
        cell.subjectCode.text = class_display.subclassCode
        cell.className.text = class_display.className
        //stack1
        cell.locationImage.image = class_display.locationPhoto
        cell.roomLabel.text = class_display.room
        cell.facultyLabel.text = class_display.faculty
        cell.campusLabel.text = class_display.campus
        //stack2
        cell.timeImage.image = class_display.timePhoto
        cell.dayLabel.text = class_display.day
        cell.timeLabel.text = class_display.time
        

        

        return cell
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
        switch (segue.identifier ?? "") {
        case "showClassDetails":
            guard let detailViewController = segue.destination as? DetailsViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedClassCell = sender as? ClassTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            guard let indexPath = tableView.indexPath(for: selectedClassCell) else {
                fatalError("The selected class cell is not being displayed by the table")
            }
            let selectedClass = classes[indexPath.row]
            detailViewController.select_class = selectedClass
        case "newClass":
            print("Navigate from Addbutton to newclass page")
            default:
            fatalError("Unexpected identifier!")
        }
    }

 
    
    
    @IBAction func unwindToMainClass(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? NewClassViewController, let new_class = sourceViewController.new_class
        {
            //Add a new Class
            let newIndexPath = IndexPath(row: classes.count, section: 0)
            
            classes.append(new_class)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
            
        }
        
    }
    //Private Method
    private func loadSampleClass(){
        let locationImage = UIImage()
        let timeImage = UIImage()
        
        guard let class1 = Class(subclassCode: "EGCO425-2018", className: "Mobile Devices", locationPhoto: locationImage, room: "Room 6274", faculty: "Engineering faculty", campus: "Mahidol", timePhoto: timeImage, day: "Tuesday", time: "10.00am - 12.00pm") else {
            fatalError("cannot load class1")
        }
        
        classes += [class1]
    }
}
