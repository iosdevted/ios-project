//
//  Article.swift
//  RxNews
//
//  Created by Ted on 2021/02/22.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}

