//
//  ArticleCell.swift
//  Project Challenge
//
//  Created by Khiem Huynh on 9/14/20.
//  Copyright © 2020 Khiem Huynh. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet weak var journalLabel: UILabel!
    @IBOutlet weak var issnLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        journalLabel.text = "Journal: "
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
