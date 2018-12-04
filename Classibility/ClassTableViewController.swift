//
//  ClassTableViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 3/11/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit
import FirebaseDatabase
import os.log

class ClassTableViewController: UITableViewController {
    //MARK: Properties
    var classes = [Class]()
  //  var testNodes = [TestNode]()
    let LocationImage = UIImage(named:"LocationIMG")
    let TimeImage = UIImage(named:"TimeIMG")
    
    
    //Database ref
    let ref = Database.database().reference()
    let classBranch = Database.database().reference(withPath: "Class/Mobile")
    let classDetail = Database.database().reference(withPath: "Class/Mobile/Details")
    
   // ref = Database.database().reference()
 //   let userID :String = Auth.auth().currentUser?.email ?? "default Email value"
    //let userID :String = Auth.auth().currentUser?.providerData["email"] ?? "default value"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       // load sampleClass
       
        
//        ref.child("Class/Mobile/Details").queryOrderedByKey().observeSingleEvent(of: .value, with: { snapshot in
//
//            guard let dict = snapshot.value as? [String:Any] else {
//                print("Error")
//                return
//            }
//            let SubjectCode = dict["Code"] as? String ?? ""
//            print(dict)
//        })
        //fetch mobile class data from firebase database
        FetchMobileClassDetails()
        //fetch pattern class data from firebase database
        FetchPatternClassDetails()
        //fetch Images class data from firebase database
        FetchImageClassDetails()
       
        
        // loadSampleClass()
        
    }
    
    //fetch mobilde class Firebase
    func FetchMobileClassDetails() {
        //ref.child("Class/pattern/details").observe(.value , with: { snapshot in
         ref.child("Class/Mobile/details").observe(.value , with: { snapshot in
          //  for i in ref.child(<#T##pathString: String##String#>)
            print(snapshot.value)
            if let dict = snapshot.value as? [String: Any] {
                let Campus = dict["campus"] as! String
                let SubjectName = dict["classname"] as! String
                let Code = dict["code"] as! String
                let Day = dict["day"] as! String
                let Faculty = dict["faculty"] as! String
                //let Roomnumber = dict["roomnumber"] as! String
                let Time = dict["time"] as! String
            
                let loaded_class = Class(campus: Campus, classname: SubjectName, code: Code, day: Day, faculty: Faculty, roomnumber: "Room", time: Time, locationPhoto: self.LocationImage, timePhoto: self.TimeImage)

                self.classes.append(loaded_class!)

                self.tableView.reloadData()
            }
        })
    }
    
    //fetch pattern class Firebase
    func FetchPatternClassDetails() {
        ref.child("Class/Pattern/details").observe(.value , with: { snapshot in
            //  for i in ref.child(<#T##pathString: String##String#>)
            print(snapshot.value)
            if let dict = snapshot.value as? [String: Any] {
                let Campus = dict["campus"] as! String
                let SubjectName = dict["classname"] as! String
                let Code = dict["code"] as! String
                let Day = dict["day"] as! String
                let Faculty = dict["faculty"] as! String
                //let Roomnumber = dict["roomnumber"] as! String
                let Time = dict["time"] as! String
                
                let patternClass = Class(campus: Campus, classname: SubjectName, code: Code, day: Day, faculty: Faculty, roomnumber: "Room", time: Time, locationPhoto: self.LocationImage, timePhoto: self.TimeImage)
                
                self.classes.append(patternClass!)
                
                self.tableView.reloadData()
            }
        })
    }
    
    //fetch images class Firebase
    func FetchImageClassDetails() {
        ref.child("Class/Images Processing/details").observe(.value , with: { snapshot in
            //  for i in ref.child(<#T##pathString: String##String#>)
            print(snapshot.value)
            if let dict = snapshot.value as? [String: Any] {
                let Campus = dict["campus"] as! String
                let SubjectName = dict["classname"] as! String
                let Code = dict["code"] as! String
                let Day = dict["day"] as! String
                let Faculty = dict["faculty"] as! String
                //let Roomnumber = dict["roomnumber"] as! String
                let Time = dict["time"] as! String
                
                let ImageClass = Class(campus: Campus, classname: SubjectName, code: Code, day: Day, faculty: Faculty, roomnumber: "Room", time: Time, locationPhoto: self.LocationImage, timePhoto: self.TimeImage)
                
                self.classes.append(ImageClass!)
                
                self.tableView.reloadData()
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
        return classes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "subjectCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ClassTableViewCell else {
            fatalError("The dequeued cell is not an instance of ClassTableViewCell")
        }
        //Fetch data from datasource
          let ClassCell = classes[indexPath.row]
       // cell.textLabel?.text = testNodes[indexPath.row].caption
        
          cell.subjectCode.text = ClassCell.code
          cell.className.text = ClassCell.classname
//        stack1
          cell.locationImage.image = ClassCell.locationPhoto
          cell.roomLabel.text = ClassCell.roomnumber
          cell.facultyLabel.text = ClassCell.faculty
          cell.campusLabel.text = ClassCell.campus
//        stack2
          cell.timeImage.image = ClassCell.timePhoto
          cell.dayLabel.text = ClassCell.day
          cell.timeLabel.text = ClassCell.time
//

        

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
            print("segue")
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
        
        
        //fetch database
        //let classBranch = Database.database().reference(withPath: "Class/Mobile")
        
        
        
      
//        guard let class1 = Class(subclassCode: "temp", className: "a", locationPhoto: locationImage, room: "Room 6274", faculty: "Engineering faculty", campus: "Mahidol", timePhoto: timeImage, day: "Tuesday", time: "10.00am - 12.00pm") else {
//            fatalError("cannot load class1")
//        }
        
      //  classes += [class1]
    }
}
