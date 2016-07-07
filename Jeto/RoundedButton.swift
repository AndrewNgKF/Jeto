//
//  RoundedButton.swift
//  Jeto
//
//  Created by IMAC on 7/7/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override func awakeFromNib() {
        layer.cornerRadius = 5.0
    }

}