//
//  PostCell.swift
//  Jeto
//
//  Created by IMAC on 8/7/16.
//  Copyright © 2016 Andrew's Personal. All rights reserved.
//

import UIKit

class JetoCell: UITableViewCell {
    
    var post: Post!
    
   
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var jetoLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(post: Post) {
        
        self.post = post
        
        
        self.titleLbl.text = post.postTitle
        self.jetoLbl.text = post.postJeto
        
        
        
    }

}
