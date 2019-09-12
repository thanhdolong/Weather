//
//  TodayViewController.swift
//  Weather
//
//  Created by Thành Đỗ Long on 11/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit
import PromiseKit
import CoreLocation

class TodayViewController: UIViewController {
    private let weatherService: WeatherService
    private let locationService: LocationService
    
    var indicator: UIView?
    var placemark: CLPlacemark?
    var viewModel: TodayWeatherViewModel?
    
    var todayView: TodayView! {
        guard isViewLoaded else { return nil }
        return (view as! TodayView)
    }
    
    init(locationService: LocationService, weatherService: WeatherService) {
        self.locationService = locationService
        self.weatherService = weatherService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator = showActivityIndicatory(onView: self.view)
        requestCurrentLocation()
    }
    
    private func requestCurrentLocation() {
        locationService.getLocation().done { location in
            self.placemark = location
            self.requestWeather(for: location)
        }.ensure {
            guard let indicator = self.indicator else { return }
            self.removeIndicator(indicator: indicator)
        }.catch { (error) in
            switch error {
            case is CLError where (error as? CLError)?.code == .denied:
                print("Error is denied")
                print("Enable Location Permissions in Settings")
            case is CLError where (error as? CLError)?.code == .network:
                print("Error is network")
                print(error.localizedDescription)
            case is CLLocationManager.PMKError:
                let error = error as! CLLocationManager.PMKError
                switch error {
                case .notAuthorized:
                    print("sem tu u not Authorized")
                }
            default:
                print("Error is default")
                print(error.localizedDescription)
            }
        }
    }
    
    private func requestWeather(for location: CLPlacemark) {
        weatherService.getCurrentWeatherForecast(location: location).done { (weather) in
            self.viewModel = TodayWeatherViewModel(place: self.placemark!, weather: weather)
            self.viewModel?.configure(self.todayView)
        }.ensure {
            guard let indicator = self.indicator else { return }
            self.removeIndicator(indicator: indicator)
        }.catch { (error) in
                print("nie")
                print(error)
                print("-----")
                print(error.localizedDescription)
        }
    }
}

