//
//  Post.swift
//  Jeto
//
//  Created by IMAC on 7/7/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import Foundation
import Firebase

class Post {
    
    var postTitle: String!
    var postJeto:String!
    
    init (postTitle: String, postJeto:String) {
        self.postTitle = postTitle
        self.postJeto = postJeto
    }
    
}