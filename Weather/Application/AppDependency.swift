//
//  AppDependency.swift
//  Weather
//
//  Created by Thành Đỗ Long on 09/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import Swinject

final class AppDependency {
    let container: Container
    
    init(container: Container = .init()) {
        self.container = container
    }
    
    public func setupDependencies() {
        container.register(NetworkManager.self) { _ in
            NetworkManager()
        }
        
        container.register(LocationService.self) { _ in
            LocationService()
        }
        
        container.register(OpenWeatherService.self) { resolver in
            OpenWeatherService(networking: resolver.resolve(NetworkManager.self)!)
        }
        
        // ViewControllers
        container.register(ForecastViewController.self) { resolver  in
            let viewController = ForecastViewController(
                locationService: resolver.resolve(LocationService.self)!,
                weatherService: resolver.resolve(OpenWeatherService.self)!)
            return viewController
        }
        
        container.register(TodayViewController.self) { resolver in
            let viewController = TodayViewController(
                locationService: resolver.resolve(LocationService.self)!,
                weatherService: resolver.resolve(OpenWeatherService.self)!)
            return viewController
        }
    }
}
