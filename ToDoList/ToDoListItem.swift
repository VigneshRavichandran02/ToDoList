//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Vignesh Ravichandran on 1/18/15.
//  Copyright (c) 2015 Prankster. All rights reserved.
//

import UIKit

class ToDoListItem: UIViewController, UITextFieldDelegate {

    @IBOutlet var item: UITextField!
    
    @IBOutlet var saveButton: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if sender as UIBarButtonItem? != saveButton {
            return
        }
        
        if self.item != nil {
        
             listItemsToLoad.append(self.item.text)
        
            NSUserDefaults.standardUserDefaults().setObject(listItemsToLoad, forKey: "todoList")
           
        }
    }

}
