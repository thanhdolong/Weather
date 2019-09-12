//
//  TodayWeatherViewModel.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit
import CoreLocation

public class TodayWeatherViewModel {
    private let place: CLPlacemark
    private let weather: CurrentWeather
    
    init(place: CLPlacemark, weather: CurrentWeather) {
        self.place = place
        self.weather = weather
    }
    
    public var weatherIcon: UIImage? {
        return UIImage(named: weather.icon)
    }
    
    public var location: String {
        guard let locality = place.locality, let country = place.country else {
            return ""
        }
        
        return "\(locality), \(country)"
    }
    
    public var temperature: String {
        return "\(String(format: "%.0f", weather.temperature)) °C | \(weather.title)"
    }
    
    public var humidity: String {
        return "\(String(format: "%.0f", weather.temperature)) %"
    }
    
    public var rain: String {
        guard let rain = weather.rain else {
            return "---"
        }
        
        return "\(String(format: "%.1f", rain)) mm"
    }
    
    public var pressure: String {
        return "\(String(format: "%.0f", weather.pressure)) hPa"
    }
    
    public var windSpeed: String {
        return "\(String(format: "%.1f", weather.wind.speed)) km/h"
    }
    
    public var windDirection: String {
        return "\(weather.wind.deg)"
    }
}

extension TodayWeatherViewModel {
    public func configure(_ view: TodayView) {
        view.curentLocationImage.isHidden = false
        
        view.weatherIconImage.image = weatherIcon
        
        view.currentLocationLabel.text = location
        view.temperatureLabel.text = temperature
        view.humidityLabel.text = humidity
        view.precipitationLabel.text = rain
        view.pressureLabel.text = pressure
        view.windSpeedLabel.text = windSpeed
        view.windDirectionLabel.text = windDirection
    }
}
