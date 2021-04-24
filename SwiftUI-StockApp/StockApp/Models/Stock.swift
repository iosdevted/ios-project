//
//  Stock.swift
//  StockApp
//
//  Created by Ted Hyeong on 21/01/2021.
//

import Foundation

struct Stock: Codable {
    let symbol: String
    let description: String
    let price: Double
    let change: String
}


