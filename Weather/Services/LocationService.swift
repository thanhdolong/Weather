//
//  LocationService.swift
//  Weather
//
//  Created by Thành Đỗ Long on 09/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import PromiseKit
import CoreLocation

class LocationService {
    var geocoder: CLGeocoder
    
    init(geocoder: CLGeocoder = .init()) {
        self.geocoder = geocoder
    }
    
     func getLocation() -> Promise<CLPlacemark> {
        return CLLocationManager.requestLocation()
                                .lastValue.then { (location) -> Promise<CLPlacemark> in
                                    return self.geocoder.reverseGeocode(location: location).firstValue
                                }
    }
    
    
}
