//
//  FirstViewController.swift
//  Jeto
//
//  Created by IMAC on 7/7/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import UIKit
import Firebase

class PostVC: UIViewController, UITextViewDelegate{
    
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var jetoField: UITextView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        jetoField.text = "What Would You Like To Gain Release From?"
        jetoField.textColor = UIColor.lightGrayColor()
//        jetoField.becomeFirstResponder()
        
        jetoField.selectedTextRange = jetoField.textRangeFromPosition(jetoField.beginningOfDocument, toPosition: jetoField.beginningOfDocument)
        jetoField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PostVC.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        let currentText: NSString = jetoField.text
        let updatedText = currentText.stringByReplacingCharactersInRange(range, withString:text)
        
        if updatedText.isEmpty {
            
            jetoField.text = "What Would You Like To Gain Release From?"
            jetoField.textColor = UIColor.lightGrayColor()
            
            jetoField.selectedTextRange = jetoField.textRangeFromPosition(jetoField.beginningOfDocument, toPosition: jetoField.beginningOfDocument)
            
            return false
        
        }   else if jetoField.textColor == UIColor.lightGrayColor() && !text.isEmpty {
            jetoField.text = nil
            jetoField.textColor = UIColor.blackColor()
        }
        
        
            return true
    }
    
    func textViewDidChangeSelection(textView: UITextView) {
        if self.view.window != nil {
            if jetoField.textColor == UIColor.lightGrayColor() {
                jetoField.selectedTextRange = jetoField.textRangeFromPosition(jetoField.beginningOfDocument, toPosition: jetoField.beginningOfDocument)
            }
        }
    }
    
    func textViewDidChange(textView: UITextView) {
        
        if jetoField.textColor == UIColor.lightGrayColor() {
            jetoField.text = ""
            jetoField.textColor = UIColor.blackColor()
        }
    }
    

    @IBAction func publishBtn(sender: AnyObject) {
        
        if ((titleField.text?.characters.count < 3 || titleField.text?.characters.count == nil) || (jetoField.text?.characters.count < 3 || jetoField.text?.characters.count == nil))
            {
            let alert = UIAlertController(title: "Sorry", message: "Your Jeto Is Too Short", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
            
            let post: Dictionary <String, String> = [
                "title": titleField.text!,
                "posts": jetoField.text!
            ]
            
            let firebasePost = DataService.ds.REF_JETO.childByAutoId()
            
            firebasePost.setValue(post)
            titleField.text = ""
            jetoField.text = "What Would You Like To Gain Release From?"
            jetoField.textColor = UIColor.lightGrayColor()

            dismissKeyboard()
            
            let successfulPostAlert = UIAlertController(title: "Post Successful", message: "Your Jeto Has Been Sent.", preferredStyle: UIAlertControllerStyle.Alert)
            successfulPostAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(successfulPostAlert, animated: true, completion: nil)
            
        }
        
        
        
        
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    

}

