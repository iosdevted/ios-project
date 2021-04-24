//
//  URLExtension.swift
//  RxWeather
//
//  Created by Ted on 2021/02/07.
//

import Foundation

extension URL {
    
    static func urlForWeatherAPI(city: String) -> URL? {
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=da69ade359c47e35161bf2e2dad374e8&units=metric")
    }
}
