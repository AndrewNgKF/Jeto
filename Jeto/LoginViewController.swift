//
//  LoginViewController.swift
//  Jeto
//
//  Created by IMAC on 23/7/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import UIKit
import Firebase



let STATUS_ACCOUNT_NONEXIST = -8

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let uid = FIRAuth.auth()?.currentUser?.uid
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    

    override func viewDidAppear(animated: Bool) {
        
        //if the user is already logged in, it will load the segue
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil {
            
            self.performSegueWithIdentifier("loggedIn", sender: nil)
            
        }
    }

    
    //if the user's account doesnt exist, it will create a new account AND THEN log the user in
    @IBAction func attemptLogin (sender: UIButton!) {
        
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
            FIRAuth.auth()?.signInWithEmail(email, password: pwd, completion: { (user, error) in
                
                if error != nil {
                    print(error)

                    if error?.code == 17011 {
                        
                        FIRAuth.auth()?.createUserWithEmail(email, password: pwd, completion: { (user, error) in
                            
                            if error != nil {
                                
                                print(error)
                                self.showErrorAlert("\(error?.code)", msg: "\(error)")
                            } else {
                                
                                
                                NSUserDefaults.standardUserDefaults().setValue(FIRAuth.auth()?.currentUser?.uid, forKey: "uid")
                                print(FIRAuth.auth()?.currentUser?.uid)
                                
                                self.performSegueWithIdentifier("loggedIn", sender: nil)
                            }
                        })
                    }
                } else {
                    self.performSegueWithIdentifier("loggedIn", sender: nil)
                }
            })
        }
        
        
                
        
        
                
        
    }
    
    
    
    
    func showErrorAlert (title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
        
}
