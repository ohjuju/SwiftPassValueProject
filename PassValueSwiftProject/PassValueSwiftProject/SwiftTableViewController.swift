//
//  SwiftTableViewController.swift
//  PassValueSwiftProject
//
//  Created by OKAR OU on 11/20/15.
//  Copyright © 2015 OKAR OU. All rights reserved.
//

import UIKit
import AFNetworking
import Mantle

class SwiftTableViewController: UITableViewController,ChangeTitleDelegate {
    
    var data = ["delegate","notification","userdefault","singleton","closure"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        self.tableView.registerNib(UINib.init(nibName: "ChannelCell", bundle: nil), forCellReuseIdentifier: "CellIdentifier")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //UserDefault
        if ((NSUserDefaults.standardUserDefaults().objectForKey("PASS_VALUE_STYLE_USER_DEFAULT")) != nil) {
            self.title = NSUserDefaults.standardUserDefaults().objectForKey("PASS_VALUE_STYLE_USER_DEFAULT") as? String
            NSUserDefaults.standardUserDefaults().removeObjectForKey("PASS_VALUE_STYLE_USER_DEFAULT")
        }
        
        //notification
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("passDataNotification:"), name: "PASS_DATA_STYLE_NOTIFICATION", object: nil)
        
        //singleton
        if (PassValueStyleModel.sharedInstance.passValueStyle != nil) {
            self.title = PassValueStyleModel.sharedInstance.passValueStyle
            PassValueStyleModel.sharedInstance.passValueStyle = nil
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ChannelCell = tableView.dequeueReusableCellWithIdentifier("CellIndetifier", forIndexPath: indexPath) as! ChannelCell
        cell.channelTitle.text = data[indexPath.row]
        cell.channelIconView.image = UIImage.init(named: "cat_lady")
        cell.channelSwitch.setOn(true, animated: true)
        
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = ViewController()
        
        //delegate
        vc.delegate = self
        //closure
        vc.initWithClosure(passValueClosure)
        self.navigationController?.pushViewController(vc, animated: true)
        vc.passDataStyle = data[indexPath.row]
    }
    
    // MARK: - Closure func
    func passValueClosure(title: String) -> Void {
        print("title is :\(title)")
        self.title = title
    }

    
    // MARK: - Delegate func
    func changeTitle(title: String) {
        print("title is :\(title)")
        self.title = title
    }
    
    // MARK: - Notification func
    func passDataNotification(notification: NSNotification) {
        let passDataDict: NSDictionary = notification.userInfo!
        let title: String = passDataDict.objectForKey("passDataStyle") as! String
        print("title is :\(title)")
        self.title = title
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
