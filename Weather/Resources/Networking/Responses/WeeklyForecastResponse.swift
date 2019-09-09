//
//  WeeklyForecastResponse.swift
//  Weather
//
//  Created by Thành Đỗ Long on 06/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import Foundation

struct WeeklyForecastResponse: Codable {
  let list: [Item]
  
  struct Item: Codable {
    let date: Date
    let main: MainClass
    let weather: [WeeklyForecastResponse.Weather]
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case main
        case weather
    }
  }
  
  struct MainClass: Codable {
    let temp: Double
  }
  
  struct Weather: Codable {
    let weatherDescription: String
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case icon
    }
  }
}
