//
//  SummaryViewController.swift
//  ToDoList
//
//  Created by 李子腾 on 10/10/15.
//  Copyright © 2015 ZT. All rights reserved.
//

import UIKit

protocol NumTasksDelegate {
    func sendBack(num : Int)
}

class SummaryViewController: UIViewController, NumTasksDelegate {
    
    @IBOutlet var numLabel: UILabel!
    
    @IBOutlet var backButton: UIBarButtonItem!
    
    var numCompleted = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backButton.target = self
        backButton.action = "goBack"
        numLabel.text = String(numCompleted)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendBack(num : Int) {
        self.numCompleted = num
    }
    
    func goBack() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
