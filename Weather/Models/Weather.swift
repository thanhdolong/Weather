//
//  Weather.swift
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

struct Weather {
    let description: String
    let temp: Double
    let humidity: Int
    let pressure: Double
    let wind: Wind
    let rain: Int?
}
