//
//  FeedTextBorder.swift
//  Jeto
//
//  Created by IMAC on 22/7/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import UIKit

class FeedTextBorder: UILabel {

   
    
    
    override func drawTextInRect(rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left: 10, bottom: 5, right: 10)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }

}
