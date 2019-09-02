//
//  Forecast.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import Foundation
//
//{"cod":"200","message":0.0045,
//    "city":{"id":1851632,"name":"Shuzenji",
//        "coord":{"lon":138.933334,"lat":34.966671},
//        "country":"JP"},
//    "cnt":38,
//    "list":[{
//    "dt":1406106000,
//    "main":{
//    "temp":298.77,
//    "temp_min":298.77,
//    "temp_max":298.774,
//    "pressure":1005.93,
//    "sea_level":1018.18,
//    "grnd_level":1005.93,
//    "humidity":87},
//    "weather":[{"id":804,"main":"Clouds","description":"overcast clouds","icon":"04d"}],
//    "clouds":{"all":88},
//    "wind":{"speed":5.71,"deg":229.501},
//    "sys":{"pod":"d"},
//    "dt_txt":"2014-07-23 09:00:00"}
//    ]}


struct Forecast {
    let date: String
    let weather: Weather
}
