//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit


public class WeatherViewModel {
    private let city: City
    private let weather: CurrentWeather
    
    init(city: City, weather: CurrentWeather) {
        self.city = city
        self.weather = weather
    }
    
    
}

extension WeatherViewModel {
    public func configure(_ view: UIView) {

    }
}
