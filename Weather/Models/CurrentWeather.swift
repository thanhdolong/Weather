//
//  CurrentWeather.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

//{"id":88319,"dt":1345284000,"name":"Benghazi",
//    "coord":{"lat":32.12,"lon":20.07},
//    "main":{"temp":306.15,"pressure":1013,"humidity":44,"temp_min":306,"temp_max":306},
//    "wind":{"speed":1,"deg":-7},
//    "weather":[
//    {"id":520,"main":"rain","description":"light intensity shower rain","icon":"09d"},
//    {"id":500,"main":"rain","description":"light rain","icon":"10d"},
//    {"id":701,"main":"mist","description":"mist","icon":"50d"}
//    ],
//    "clouds":{"all":90},
//    "rain":{"3h":3}}

import Foundation

struct CurrentWeather {
    let icon: String
    let title: String
    let fullDescription: String
    let temperature: Double
    let humidity: Int
    let pressure: Double
    let wind: Wind
    let rain: Double?
    
    struct Wind {
        let deg: Double
        let speed: Double
    }
}

extension CurrentWeather {
    init(response: CurrentWeatherForecastResponse) {
        let weather = response.weather.first!
        
        self.icon = weather.icon
        self.title = weather.main
        self.fullDescription = weather.weatherDescription
        self.temperature = response.main.temperature
        self.humidity = response.main.humidity
        self.pressure = response.main.pressure
        self.wind = Wind(deg: response.wind.deg, speed: response.wind.speed)
        self.rain = response.rain?.volume
    }
}
