//
//  ForecastViewModel.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit

public class ForecastViewModel {
    private let city: City
    private let forecast: [DailyWeather]
    
    init(city: City, forecast: [DailyWeather]) {
        self.city = city
        self.forecast = forecast
    }
}

extension ForecastViewModel {
    public func configure(_ view: UIView) {
        
    }
}

