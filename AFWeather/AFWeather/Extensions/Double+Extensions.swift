//
//  Double+Extensions.swift
//  AFWeather
//
//  Created by Ted on 2021/02/28.
//

import Foundation

extension Double {
    
    func toString() -> String {
        return String(format: "%.1f", self)
    }
    
    func toInt() -> Int {
        return Int(self)
    }
}
