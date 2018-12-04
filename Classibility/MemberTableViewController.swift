//
//  MemberTableViewController.swift
//  Classibility
//
//  Created by Kanta'MacPro on 4/12/2561 BE.
//  Copyright © 2561 Kanta'MacPro. All rights reserved.
//

import UIKit

class MemberTableViewController: UITableViewController {
    var members = [Member]()
    override func viewDidLoad() {
        super.viewDidLoad()

       loadStudent()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return members.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellidentifier = "MemberCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellidentifier, for: indexPath) as? MemberTableViewCell else {
            fatalError("The dequeued cell is not an instance of MemberCell")
        }
        let students = members[indexPath.row]
       cell.studentName.text = students.student

        return cell
    }
    
    //private function
    private func loadStudent(){
        guard let student1 = Member(student: "kantachat_2539") else {
            fatalError("student1 not found!")
        }
        guard let student2 = Member(student: "Emma_watson") else {
            fatalError("student2 not found!")
        }
        guard let student3 = Member(student: "Jack Scroll") else {
            fatalError("student3 not found!")
        }
        guard let student4 = Member(student: "Harry Potter") else {
            fatalError("student4 not found!")
        }
        guard let student5 = Member(student: "Donald trump") else {
            fatalError("student5 not found!")
        }
        members += [student1,student2,student3,student4,student5]
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
