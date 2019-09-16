//
//  WeatherTestSpecs.swift
//  WeatherTests
//
//  Created by Thành Đỗ Long on 16/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import Intents
import Contacts
import PromiseKit
import Nimble
import Quick
import Swinject

@testable import Weather

class WeatherTestsSpecs: QuickSpec {
    
    override func spec() {
        var container: Container!
        var placemark: CLPlacemark!
    
        beforeEach {
            let location = CLLocation(latitude: 14.42, longitude: 50.09)
            placemark = CLPlacemark.init(location: location,
                                            name: nil,
                                            postalAddress: nil)
            
            container = Container()
            container.register(Networking.self) { _ in NetworkingManager() }
            container.register(OpenWeatherService.self) { resolver in OpenWeatherService(networking: resolver.resolve(Networking.self)!)}
        }
        
        describe("Weather service") {
            context("when request current weather") {
                it("should return data") {
                    let fetcher = container.resolve(OpenWeatherService.self)!
                    
                    fetcher.getCurrentWeatherForecast(location: placemark).catch { (error) in
                        switch error {
                        case is CLError where (error as? CLError)?.code == .network:
                            fail("The network was unavailable or a network error occurred.")
                        default:
                            fail("\(error)")
                        }
                    }
                }
            }
            
            context("when request weekly weather") {
                it("should return data") {
                    let fetcher = container.resolve(OpenWeatherService.self)!
                    
                    fetcher.getWeeklyWeatherForecast(location: placemark).catch { (error) in
                        switch error {
                        case is CLError where (error as? CLError)?.code == .network:
                            fail("The network was unavailable or a network error occurred.")
                        default:
                            fail("\(error)")
                        }
                    }
                    
                }
            }
        }
    }
}

