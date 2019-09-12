//
//  ForecastViewModel.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit
import CoreLocation

public class ForecastViewModel {
    
    private let place: CLPlacemark
    private var forecast: [DateComponents : [DailyWeather]]
    
    init(place: CLPlacemark, forecast: [DailyWeather]) {
        self.place = place
        
        self.forecast = Dictionary(grouping: forecast) { (weather) -> DateComponents in
            let date = Calendar.current.dateComponents([.day, .month, .year, .weekday], from: weather.date)
            return date
        }
    }
    
    public func titleForHeaderInSection(_ section: Int) -> String? {
        let calendar = Calendar.current
        
        let dateComponent = getKeyFrom(section)
        
        if isCurrentDateInToday(from: dateComponent) {
            return "Today"
        } else {
            let localizedWeekday = calendar.weekdaySymbols[dateComponent.weekday! - 1]
            return localizedWeekday
        }
    }
    
    public func loremIpsum(_ indexPath: IndexPath) -> String? {
        let key = getKeyFrom(indexPath.section)
        let weather = forecast[key]![indexPath.row]
        return "\(weather.date) \(weather.description)"
    }
    
    public var numberOfSections: Int {
        return forecast.count
    }
    
    public func numberOfRowsInSection(_ section: Int) -> Int {
        let key = getKeyFrom(section)
        return forecast[key]!.count
    }
    
    private func isCurrentDateInToday(from date: DateComponents) -> Bool {
        guard let date = Calendar.current.date(from: date) else { return false }
        
        return Calendar.current.isDateInToday(date)
    }
    
    private func getKeyFrom(_ section: Int) -> DateComponents {
        return Array(forecast.keys).sorted(by: { (firstDate, secondDate) -> Bool in
            let calendar = Calendar.current
            return calendar.date(from: firstDate)!.timeIntervalSince1970 < calendar.date(from: secondDate)!.timeIntervalSince1970
        })[section]
    }
}

extension ForecastViewModel {
    public func configure(_ view: UIView) {
        
    }
}

