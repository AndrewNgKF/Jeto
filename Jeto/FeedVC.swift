//
//  SecondViewController.swift
//  Jeto
//
//  Created by IMAC on 7/7/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import UIKit
import Firebase

import MessageUI

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, MFMailComposeViewControllerDelegate {
    
    var posts = [Post]()
    
    var post: Post!
    var filteredJeto = [Post]()
//    var jetoFilter = [Post]()

    
    @IBOutlet weak var jetoSearchBar: UISearchBar!
    var inSearchMode:Bool = false
    
    
    
    @IBOutlet weak var feedTableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FeedVC.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
        feedTableView.rowHeight = UITableViewAutomaticDimension
        feedTableView.estimatedRowHeight = 200
        
        
        jetoSearchBar.delegate = self
        jetoSearchBar.returnKeyType = UIReturnKeyType.Done
        
        
        //TODO - put posts into a dictionary and display it to the tableView
        
        
        DataService.ds.REF_JETO.observeEventType(.Value, withBlock: { snapshot in

//            print(snapshot.value)
            
            self.posts = []
            
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshots {
                    print("SNAP: \(snap)")
                    
                    let key = snap.childSnapshotForPath("title")
                    let keyStr = String(key)
                    let keyFormat = keyStr.stringByReplacingOccurrencesOfString("Snap (title)", withString: "")
                    
                    let jeto = snap.childSnapshotForPath("posts")
                    let jetoStr = String(jeto)
                    let jetoFormat = jetoStr.stringByReplacingOccurrencesOfString("Snap (posts)", withString: "")
                    
                    
                    let post = Post(postTitle: keyFormat, postJeto: jetoFormat)
                    self.posts.append(post)
                    
                    print(keyFormat)
                    print(jeto)
                    
                }
            }
            self.feedTableView.reloadData()
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = posts.reverse()[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("JetoCell") as? JetoCell
        
        var filteredCells: Post!
        
        if inSearchMode {
            filteredCells = filteredJeto[indexPath.row]
            cell?.configureCell(filteredCells)
        } else {
            cell?.configureCell(post)
        }

        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if inSearchMode {
            return filteredJeto.count
        } else {
            return posts.count
        }
    }
    
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        view.endEditing(true)
//    }
    
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            feedTableView.reloadData()
            
        } else {
            inSearchMode = true
            let lower = searchBar.text!.lowercaseString
            
            filteredJeto = posts.filter({$0.postTitle.rangeOfString(lower) != nil }) + posts.filter({$0.postJeto.rangeOfString(lower) != nil })
                
//                print(filteredJeto)
            
                
            feedTableView.reloadData()
        }
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
//    @IBAction func launchReportEmail(sender: AnyObject){
//        let emailTitle = "Report Questionable Post"
//        let messageBody = "Hi, I would like to file a report on this post."
//        let toRecipents = ["andrew.ctrl.alt.del@gmail.com"]
//        
//        
//        let mc: MFMailComposeViewController = MFMailComposeViewController()
//        mc.mailComposeDelegate = self
//        mc.setSubject(emailTitle)
//        mc.setMessageBody(messageBody, isHTML: false)
//        mc.setToRecipients(toRecipents)
//        
//        self.presentViewController(mc, animated: true, completion: nil)
//        
//    }
//    
   
    
    
    @IBAction func sendEmail(sender:AnyObject) {
    
    let email = "andrew.ctrl.alt.del@gmail.com"
    let url = NSURL(string: "mailto:\(email)")
    UIApplication.sharedApplication().openURL(url!)
    
    }
    
    
    
}


