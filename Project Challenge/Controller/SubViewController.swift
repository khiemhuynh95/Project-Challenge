//
//  SubViewController.swift
//  Project Challenge
//
//  Created by Khiem Huynh on 9/14/20.
//  Copyright © 2020 Khiem Huynh. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    @IBOutlet weak var journalLabel: UILabel!
    @IBOutlet weak var issnLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var authorsLabel: UILabel!
    
    var article: ArticleModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        journalLabel.text?.append(article!.journal)
        issnLabel.text?.append(article!.issn)
        typeLabel.text?.append(article!.article_type)
        
        for author in article!.authors {
            authorsLabel.text?.append(author + ", ")
        }
    }
    
    

}
