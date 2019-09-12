//
//  OpenWeatherRequest.swift
//  Weather
//
//  Created by Thành Đỗ Long on 05/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import Alamofire

public enum OpenWeatherRoute {
    case currentWeather(lat: Double, lng: Double)
    case forecast(lat: Double, lng: Double)
}

extension OpenWeatherRoute: Route {
    var version: String {
        return "2.5"
    }
    
    var baseURL: String {
        return "https://api.openweathermap.org/data/\(version)"
    }
    
    var method: HTTPMethod {
        switch self {
        case .currentWeather:
            return .get
        case .forecast:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .currentWeather:
            return "/weather"
        case .forecast:
            return "/forecast"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .currentWeather(let lat, let lng):
            return [
                "lat": lat,
                "lon": lng,
                "units": "metric",
                "appid": "7823f667f5f356e0d6e680998463907d"
            ]
        case .forecast(let lat, let lng):
            return [
                "lat": lat,
                "lon": lng,
                "units": "metric",
                "appid": "7823f667f5f356e0d6e680998463907d"
            ]
        }
    }
}
