//
//  TableViewController.swift
//  ToDoList
//
//  Created by 李子腾 on 10/10/15.
//  Copyright © 2015 ZT. All rights reserved.
//

import UIKit

protocol ModifyTableDelegate {
    func sendBack(str: String)
}

class TableViewController: UITableViewController, ModifyTableDelegate {
    
    var stringModel : [String]! = []
    var boolModel : [Bool]! = []
    var delegate : NumTasksDelegate?
    var numCompleted : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSTimer.scheduledTimerWithTimeInterval(24*60*60, target: self, selector: "removeTasks", userInfo:nil, repeats: true)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stringModel.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell", forIndexPath: indexPath)

        // Configure the cell...
        let label: UILabel = UILabel(frame: CGRectMake(250, 10, 80, 30))
        label.textColor = UIColor.greenColor()
        if boolModel[indexPath.row] {
            label.text = "Done"
        } else {
            label.text = ""
        }
        label.tag = indexPath.row
        label.textAlignment = NSTextAlignment.Right
        cell.contentView.addSubview(label)
        cell.textLabel?.text = stringModel[indexPath.row]
        
        let btn = UIButton()
        btn.setTitle("Delete", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        btn.frame = CGRectMake(330, 2, 80, 44)
        btn.addTarget(self, action: "deleteButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        btn.tag = indexPath.row
        cell.contentView.addSubview(btn)

        return cell
    }
    
    func sendBack(str: String) {
        stringModel.append(str)
        boolModel.append(false)
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is AddTaskViewController {
            let vc = segue.destinationViewController as! AddTaskViewController
            vc.delegate = self
        } else {
            let vc = segue.destinationViewController as! SummaryViewController
            self.delegate = vc
            self.delegate?.sendBack(numCompleted)
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if !self.boolModel[indexPath.row] {
            self.numCompleted++
        }
        self.boolModel[indexPath.row] = true
        tableView.reloadData()
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
        
    
    
    func deleteButtonPressed(sender:UIButton) {
        stringModel.removeAtIndex(sender.tag)
        boolModel.removeAtIndex(sender.tag)
        self.tableView.reloadData()
    }
    
    
    func removeTasks() {
        self.stringModel.removeAll()
        self.boolModel.removeAll()
        self.numCompleted = 0
        self.tableView.reloadData()
    }

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
