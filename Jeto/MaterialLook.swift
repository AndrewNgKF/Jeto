//
//  Material.swift
//  Jeto
//
//  Created by IMAC on 9/7/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import UIKit

let SHADOW_COLOR: CGFloat = 157.0 / 255.0

class MaterialLook: UIView {
    
    override func awakeFromNib() {
        
        layer.cornerRadius = 5.0
        self.clipsToBounds = true
        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
    }
    
   
    
    
}
