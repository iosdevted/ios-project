//
//  WeatherManager.swift
//  AFWeather
//
//  Created by Ted on 2021/02/28.
//

import Foundation
import Alamofire

enum WeatherError: Error, LocalizedError {
    
    case unknown
    case invalidCity
    case custom(description: String)
    
    var errorDescription: String? {
        switch self {
        case .unknown:
            return "Hey, this is an unknown Error!"
        case .invalidCity:
            return "This is an invalid city. Please try again."
        case .custom(let description):
            return description
        }
    }
}

struct WeatherManager {
    
    private let API_KEY: String = "da69ade359c47e35161bf2e2dad374e8"
    
    func fetchWeather(lat: Double, lon: Double, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        
        let path = "https://api.openweathermap.org/data/2.5/weather?APPID=\(API_KEY)&units=metric&lat=\(lat)&lon=\(lon)"
        let urlString = String(format: path)
        
        handleRequest(urlString: urlString, completion: completion)
    }
    
    func fetchWeather(byCity city: String, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        
        let query = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? city
        
        let path = "https://api.openweathermap.org/data/2.5/weather?q=\(query)&APPID=\(API_KEY)&units=metric"
        let urlString = String(format: path)
        
        handleRequest(urlString: urlString, completion: completion)

    }
    
    private func handleRequest(urlString: String, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        AF.request(urlString)
            .validate()
            .responseDecodable(of: WeatherData.self, queue: .main, decoder: JSONDecoder()) { (response) in
            
            switch response.result {
            
            case .success(let weatherData):
                let model = weatherData.model
                completion(.success(model))
            case .failure(let error):

                if let err = self.getWeatherError(error: error, data: response.data) {
                    completion(.failure(err))
                } else {
                    completion(.failure(error))
                }
                
//                if error.responseCode == 404 {
//                    let invalidCityError = WeatherError.custom(description: "")
//                    completion(.failure(invalidCityError))
//                } else {
//                    completion(.failure(error))
//                }
            }
        }
    }
    
    private func getWeatherError(error: AFError, data: Data?) -> Error? {
        //status == 404 && payload is parsable
        // => message
        // else, return else
        
        if error.responseCode == 404,
           let data = data,
           let failure = try? JSONDecoder().decode(WeatherDataFailure.self, from: data) {
            let message = failure.message
            return WeatherError.custom(description: message)
        } else {
            return nil
        }
    }
}
