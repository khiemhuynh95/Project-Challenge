//
//  ViewController.swift
//  Project Challenge
//
//  Created by Khiem Huynh on 9/14/20.
//  Copyright © 2020 Khiem Huynh. All rights reserved.
//

import UIKit
import SwiftUI
class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var articles : [ArticleModel] = []
    var articleManager = ArticleManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        articleManager.delegate = self
        articleManager.fetchArticle()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSubView" {
            if let destinationVC = segue.destination as? SubViewController, let article = sender as? ArticleModel {
                destinationVC.article = article
            }
        }
    }
}


extension ViewController: ArticleManagerDelegate {
    func didUpdateArticle(_ articleManager: ArticleManager, articleModels: [ArticleModel]) {
        DispatchQueue.main.async {
            self.articles = articleModels
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selected = indexPath.row
        
        performSegue(withIdentifier: "ToSubView", sender: articles[selected])
    }
}


extension ViewController: UITableViewDataSource {
    //Tableview Datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! ArticleCell
        cell.journalLabel?.text = "Journal: " + articles[indexPath.row].journal
        cell.issnLabel?.text = "Issn: " + articles[indexPath.row].issn
        cell.typeLabel?.text = "Article type: " + articles[indexPath.row].article_type
        cell.authorsLabel?.text = "Author: " + articles[indexPath.row].authors[0]
      
        return cell
    }
}
