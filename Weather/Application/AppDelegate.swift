//
//  AppDelegate.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit
import Alamofire
import PromiseKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    public lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    public lazy var appDependency = AppDependency()
    public lazy var tabBarRouter = TabBarRouter(window: window!)
    public lazy var forecastCoordinator = ForecastCoordinator(router: tabBarRouter, container: appDependency.container)
    public lazy var homeCoordinator = TodayCoordinator(router: tabBarRouter, container: appDependency.container)

    func application(_: UIApplication, willFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        appDependency.setupDependencies()
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        homeCoordinator.present(animated: true, onDismissed: nil)
        forecastCoordinator.present(animated: true, onDismissed: nil)
    
//        let locationService = LocationService()
//        print(locationService.locationState)
//        let location = CLLocationManager
//            .requestLocation()
//            .lastValue
        
//        requestWeather(location: location)
//        requestAdress(location: location)
        
//        firstly {
//            CLLocationManager
//            .requestLocation()
//            .lastValue
//        } .then { (location)  in
//            when(fulfilled: requestAdress(location: location), requestWeather(location: location))
//        }
        
        return true
    }
    
//    func requestAdress(location: Promise<CLLocation>) -> Promise<CLPlacemark> {
//        location.then { (location) in
//            return CLGeocoder().reverseGeocode(location: location).firstValue
//        }
//    }
//    
//    func requestWeather(location: Promise<CLLocation>) {
//        let networking = NetworkManager()
//        let service = OpenWeatherService(networking: networking)
//        
//        location.then { location in
//            service.getCurrentWeatherForecast(lat: location.coordinate.latitude, lng: location.coordinate.longitude)
//        }.done { (weather) in
//            print("Yey")
//            print(weather)
//        }.catch { (error) in
//            print("nie")
//            print(error)
//            print("-----")
//            print(error.localizedDescription)
//        }
//    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


//                if let pmkerror = error as? CLLocationManager.PMKError {
//                    switch pmkerror {
//                    case .notAuthorized:
//
//                    @unknown default:
//
//                    }
//                    print("debug description")
//                    print(pmkerror.localizedDescription)
//                    print("error description")
//                    print(pmkerror.errorDescription)
//                    print("helpanchor")
//                    print(pmkerror.helpAnchor)
//                    print("failure reanon")
//                    print(pmkerror.failureReason)
//                    print("recovery suggestion")
//                    print(pmkerror.recoverySuggestion)
//                    print("localizated description")
//                    print(pmkerror.localizedDescription)
//                    print("localizated as AFError")
//                    print(pmkerror.asAFError)
//                }
