//
//  WeatherResult.swift
//  RxWeather
//
//  Created by Ted on 2021/02/07.
//

import Foundation

struct WeatherResult: Codable {
    let main: Weather
}

extension WeatherResult {
    
    static var empty: WeatherResult {
        return WeatherResult(main: Weather(temp: 0.0, humidity: 0.0))
    }
}

struct Weather: Codable {
    let temp: Double
    let humidity: Double
}

