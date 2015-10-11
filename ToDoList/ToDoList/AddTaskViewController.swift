//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by 李子腾 on 10/10/15.
//  Copyright © 2015 ZT. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    var delegate: ModifyTableDelegate?

    @IBOutlet var textField: UITextField!
    
    @IBOutlet var cancelButton: UIBarButtonItem!
    
    @IBOutlet var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cancelButton.target = self
        doneButton.target = self
        cancelButton.action = "cancel"
        doneButton.action = "done"
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGrayColor().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cancel() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func done() {
        if textField.hasText() {
           delegate?.sendBack(textField.text!)
        }
        cancel()
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
