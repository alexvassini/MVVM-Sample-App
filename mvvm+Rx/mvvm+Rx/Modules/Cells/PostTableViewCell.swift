//
//  PostTableViewCell.swift
//  mvvm+Rx
//
//  Created by Alexandre  Vassinievski on 27/08/2018.
//  Copyright © 2018 vassini. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var numberOfCommentsLabel: UILabel!
    
    @IBOutlet weak var postContentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
