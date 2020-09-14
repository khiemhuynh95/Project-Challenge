//
//  ArticleManager.swift
//  Project Challenge
//
//  Created by Khiem Huynh on 9/14/20.
//  Copyright © 2020 Khiem Huynh. All rights reserved.
//

import Foundation

protocol ArticleManagerDelegate {
    func didUpdateArticle(_ articleManager: ArticleManager, articleModels: [ArticleModel])
    func didFailWithError(_ error: Error)
}

struct ArticleManager {
    let url = "https://api.plos.org/search?q=title:DNA"
    
    func fetchArticle() {
        self.performRequest(url)
    }
    
    var delegate: ArticleManagerDelegate?
    
    func performRequest(_ urlString: String)  {
        //1.Create a URL
        if let url = URL(string: urlString) {
            //2.Create a URLSession
            let session = URLSession(configuration: .default)
            //3.Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                    if let articles = self.parseJSON(safeData) {
                        self.delegate?.didUpdateArticle(self, articleModels: articles)
                    }
                }
            }
            //4.Start the task
            task.resume()
        }
        
    }
    
    
    func parseJSON(_ articleData: Data) -> [ArticleModel]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(ArticleData.self, from: articleData)
            var articles: [ArticleModel] = []
            let docs = decodedData.response.docs
            for doc in docs {
                let artile = ArticleModel(journal: doc.journal, issn: doc.eissn, article_type: doc.article_type, authors: doc.author_display)
                articles.append(artile)
            }
            return articles
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
        
    }
}
