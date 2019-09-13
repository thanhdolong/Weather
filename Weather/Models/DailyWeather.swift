//
//  DailyWeather.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import Foundation

struct DailyWeather {
    let icon: String
    let description: String
    let temperature: Double
    let date: Date
}

extension DailyWeather {
    init(response: WeeklyForecastResponse.Item) {
        let weather = response.weather.first!
        self.icon = weather.icon
        self.description = weather.weatherDescription
        self.temperature = response.main.temp
        self.date = response.date
    }
}
