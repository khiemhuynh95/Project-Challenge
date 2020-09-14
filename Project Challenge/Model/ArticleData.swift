//
//  ArticleData.swift
//  Project Challenge
//
//  Created by Khiem Huynh on 9/14/20.
//  Copyright © 2020 Khiem Huynh. All rights reserved.
//

import Foundation
struct ArticleData: Codable {
    let response: Response
    
    struct Response: Codable {
        let docs: [Docs]
    }
    
    struct Docs: Codable {
        let journal: String
        let eissn: String
        let article_type: String
        let author_display: [String]
    }
}
