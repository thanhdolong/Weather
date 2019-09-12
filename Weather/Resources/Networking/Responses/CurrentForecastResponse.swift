//
//  CurrentWeatherForecastResponse.swift
//  Weather
//
//  Created by Thành Đỗ Long on 06/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import Foundation

struct CurrentWeatherForecastResponse: Decodable {
    let name: String
    let weather: [CurrentWeatherForecastResponse.Weather]
    let main: Main
    let wind: CurrentWeatherForecastResponse.Wind
    let rain: CurrentWeatherForecastResponse.Rain?
    
    struct Weather: Codable {
        let icon: String
        let main: String
        let weatherDescription: String
        
        enum CodingKeys: String, CodingKey {
            case icon
            case main
            case weatherDescription = "description"
        }
    }
    
    struct Main: Codable {
        let temperature: Double
        let pressure: Double?
        let humidity: Int?
        
        enum CodingKeys: String, CodingKey {
            case temperature = "temp"
            case pressure
            case humidity
        }
    }
    
    struct Wind: Codable {
        let deg: Double?
        let speed: Double?
    }
    
    struct Rain: Codable {
        let volume: Double?
        
        enum CodingKeys: String, CodingKey {
            case volume = "3h"
        }
    }
}

