//
//  Article.swift
//  MVVM-News
//
//  Created by Ted Hyeong on 19/01/2021.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String
}
