//
//  RecordTableViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 4/12/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import FirebaseDatabase
import os.log

class RecordTableViewController: UITableViewController {

    var records = [Record]()
    var sentClass : HisClass?
    let vectorImage = UIImage(named: "vectorIMG")
    
    //Database reference
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if sentClass?.hisClassName == "EGCO464-Image Processing"{
            FetchImageLecture()
        } else if sentClass?.hisClassName == "EGCO428-Mobile Device" {
            FetchMobileLecture()
        } else if sentClass?.hisClassName == "EGCO463-Pattern Recognition" {
            FetchPatternLecture()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return records.count
    }
    
    
    //private function
    //fetch mobile lecture data Firebase
    func FetchMobileLecture(){
        ref.child("Class/Mobile/lectures").observe(.value, with: { snapshot in
            print(snapshot.value)
            if let dict = snapshot.value as? [String: Any]{
                let week1 = dict["week1"] as! String
                let week2 = dict["week2"] as! String
                let week3 = dict["week3"] as! String
                let week4 = dict["week4"] as! String
                let week5 = dict["week5"] as! String
                
                print(week1)
                let load_week1 = Record(week: week1, date: "15-Oct-18", room: "6272", arrow: self.vectorImage!)
                let load_week2 = Record(week: week2, date: "19-Oct-18", room: "6272", arrow: self.vectorImage!)
                let load_week3 = Record(week: week3, date: "24-Oct-18", room: "6272", arrow: self.vectorImage!)
                let load_week4 = Record(week: week4, date: "1-Nov-18", room: "6272", arrow: self.vectorImage!)
                let load_week5 = Record(week: week5, date: "15-Nov-18", room: "6272", arrow: self.vectorImage!)
                
                self.records.append(load_week1)
                self.records.append(load_week2)
                self.records.append(load_week3)
                self.records.append(load_week4)
                self.records.append(load_week5)
                self.tableView.reloadData()
                
            }
        })
    }
    
    //fetch pattern lecture data Firebase
    func FetchPatternLecture(){
        ref.child("Class/Pattern/lectures").observe(.value, with: { snapshot in
            print(snapshot.value)
            if let dict = snapshot.value as? [String: Any]{
                let week1 = dict["week1"] as! String
                let week2 = dict["week2"] as! String
                let week3 = dict["week3"] as! String
                let week4 = dict["week4"] as! String
                //  let week5 = dict["week5"] as! String
                
                print(week1)
                let load_week1 = Record(week: week1, date: "15-Oct-18", room: "6274", arrow: self.vectorImage!)
                let load_week2 = Record(week: week2, date: "19-Oct-18", room: "6274", arrow: self.vectorImage!)
                let load_week3 = Record(week: week3, date: "24-Oct-18", room: "6274", arrow: self.vectorImage!)
                let load_week4 = Record(week: week4, date: "1-Nov-18", room: "6274", arrow: self.vectorImage!)
                // let load_week5 = Lecture(week: week5, date: "15-Nov-18", room: "6274", arrow: self.vectorImage!)
                
                self.records.append(load_week1)
                self.records.append(load_week2)
                self.records.append(load_week3)
                self.records.append(load_week4)
                //  self.lectures.append(load_week5)
                self.tableView.reloadData()
                
            }
        })
    }
    
    //fetch Images lecture data Firebase
    func FetchImageLecture(){
        ref.child("Class/Images Processing/lectures").observe(.value, with: { snapshot in
            print(snapshot.value)
            if let dict = snapshot.value as? [String: Any]{
                let week1 = dict["week1"] as! String
                let week2 = dict["week2"] as! String
                let week3 = dict["week3"] as! String
                let week4 = dict["week4"] as! String
                let week5 = dict["week5"] as! String
                
                print(week1)
                let load_week1 = Record(week: week1, date: "15-Oct-18", room: "6275", arrow: self.vectorImage!)
                let load_week2 = Record(week: week2, date: "19-Oct-18", room: "6275", arrow: self.vectorImage!)
                let load_week3 = Record(week: week3, date: "24-Oct-18", room: "6275", arrow: self.vectorImage!)
                let load_week4 = Record(week: week4, date: "1-Nov-18", room: "6275", arrow: self.vectorImage!)
                let load_week5 = Record(week: week5, date: "15-Nov-18", room: "6275", arrow: self.vectorImage!)
                
                self.records.append(load_week1)
                self.records.append(load_week2)
                self.records.append(load_week3)
                self.records.append(load_week4)
                self.records.append(load_week5)
                self.tableView.reloadData()
                
            }
        })
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "recordCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RecordTableViewCell else {
            fatalError("The dequeued cell is not an instance of RecordTableViewCell")
        }

        // Configure the cell...
        let recordCell = records[indexPath.row]
        cell.recordName.text = recordCell.week
        cell.recordDate.text = recordCell.date
        cell.recordRoom.text = recordCell.room
        cell.recordVector.image = recordCell.arrow

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
