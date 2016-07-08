//
//  SecondViewController.swift
//  Jeto
//
//  Created by IMAC on 7/7/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var posts = [Post]()
    var post: Post!
    
    
    
    
    
    @IBOutlet weak var feedTableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        //TODO - put posts into a dictionary and display it to the tableView
        
        
        DataService.ds.REF_JETO.observeEventType(.Value, withBlock: { snapshot in

//            print(snapshot.value)
            
//            self.posts = []
            
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
        
        cell!.configureCell(post)
        
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    
   

    

}


