//
//  ToDoList.swift
//  ToDoList
//
//  Created by Vignesh Ravichandran on 1/18/15.
//  Copyright (c) 2015 Prankster. All rights reserved.
//

import UIKit

var listItemsToLoad = [String]()

class ToDoList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    @IBAction func unwindToList (segue: UIStoryboardSegue){
        tableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listItemsToLoad.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = listItemsToLoad[indexPath.row]
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            listItemsToLoad.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(listItemsToLoad, forKey: "todoList")
            
            tableView.reloadData()
        }
    }

    
     override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("todoList") != nil {
            
            listItemsToLoad = NSUserDefaults.standardUserDefaults().objectForKey("todoList") as [String]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
