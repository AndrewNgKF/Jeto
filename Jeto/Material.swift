//
//  Material.swift
//  Jeto
//
//  Created by IMAC on 9/7/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import UIKit

let SHADOW_COLOR: CGFloat = 157.0 / 255.0

class Material: UIView {
    
    override func awakeFromNib() {
        self.clipsToBounds = true
        layer.cornerRadius = 5.0
//        layer.shadowColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).CGColor
//        layer.shadowOpacity = 0.8
//        layer.shadowRadius = 10.0
//        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        
    }
    
}
