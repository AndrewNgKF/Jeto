//
//  DataService.swift
//  Jeto
//
//  Created by IMAC on 7/7/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import Foundation


import Foundation
import Firebase

let URL_BASE = FIRDatabase.database().reference()

class DataService {
    
    static let ds = DataService()
    
    var REF_BASE = URL_BASE
    var REF_JETO = URL_BASE.child("jeto")
    var REF_USERS = URL_BASE.child("users")
    
    
    
    
}
