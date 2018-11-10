//
//  LecturesTableViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 10/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import FirebaseDatabase
import os.log


class LecturesTableViewController: UITableViewController {
    //MARK: Properties
    @IBOutlet weak var LectureOrder: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var room: UILabel!
    var lectures = [Lecture]()
    let vectorImage = UIImage(named: "vectorIMG")
    
   //Database reference
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FetchLecture()
        print(lectures)
    }

    
    //private function
    func FetchLecture(){
        ref.child("Class/Mobile/lectures").observe(.value, with: { snapshot in
            print(snapshot.value)
            if let dict = snapshot.value as? [String: Any]{
                let week1 = dict["week1"] as! String
                let week2 = dict["week2"] as! String
                let week3 = dict["week3"] as! String
                let week4 = dict["week4"] as! String
                let week5 = dict["week5"] as! String
                
                print(week1)
                let load_week1 = Lecture(week: week1, date: "15-Oct-18", room: "6274", arrow: self.vectorImage!)
                let load_week2 = Lecture(week: week2, date: "19-Oct-18", room: "6274", arrow: self.vectorImage!)
                let load_week3 = Lecture(week: week3, date: "24-Oct-18", room: "6274", arrow: self.vectorImage!)
                let load_week4 = Lecture(week: week4, date: "1-Nov-18", room: "6274", arrow: self.vectorImage!)
                let load_week5 = Lecture(week: week5, date: "15-Nov-18", room: "6274", arrow: self.vectorImage!)
                
                self.lectures.append(load_week1)
              //  self.lectures.append(load_week2)
              //  self.lectures.append(load_week3)
              //  self.lectures.append(load_week4)
              //  self.lectures.append(load_week5)
               
            }
        })
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lectures.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "LectureCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? LectureTableViewCell else {
            fatalError("The dequeue cell is not an instance of LectureTebleViewCell")
        }
        // Configure the cell...
        let lectureCell = lectures[indexPath.row]
        cell.lectureOrder.text = lectureCell.week
        cell.lectureDate.text = lectureCell.date
        cell.lectureRoom.text = lectureCell.room
        cell.lectureVector.image = lectureCell.arrow
        

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
