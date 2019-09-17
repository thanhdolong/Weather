//
//  LocationService.swift
//  Weather
//
//  Created by Thành Đỗ Long on 09/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import PromiseKit
import CoreLocation

protocol LocationServiceDelegate: class {
    func openWeatherServiceDidReceivedNetworkError(_ viewController: UIViewController)
}

class LocationService {
    let geocoder: CLGeocoder
    weak var delegate: LocationServiceDelegate?
    
    // MARK: - Object Lifecycle
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
