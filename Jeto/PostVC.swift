//
//  FirstViewController.swift
//  Jeto
//
//  Created by IMAC on 7/7/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import UIKit
import Firebase

class PostVC: UIViewController {
    
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var jetoField: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func publishBtn(sender: AnyObject) {
        
        let post: Dictionary <String, String> = [
            "title": titleField.text!,
            "posts": jetoField.text!
        ]
        
        let firebasePost = DataService.ds.REF_JETO.childByAutoId()
        
        firebasePost.setValue(post)
        
    }

}

