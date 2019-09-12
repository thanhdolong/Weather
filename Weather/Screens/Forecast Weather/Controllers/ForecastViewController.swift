//
//  ForecastViewController.swift
//  Weather
//
//  Created by Thành Đỗ Long on 02/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit
import PromiseKit
import CoreLocation

final class ForecastViewController: UIViewController {
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(refresh(_:)),
                                 for: UIControl.Event.valueChanged)

        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Weather")
        return refreshControl
    }()
    
    private let weatherService: WeatherService
    private let locationService: LocationService
    
    var indicator: UIView?
    var placemark: CLPlacemark?
    var viewModel: ForecastViewModel?
    
    var forecastView: ForecastView! {
        guard isViewLoaded else { return nil }
        return (view as! ForecastView)
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
        forecastView.tableView.dataSource = self
        forecastView.tableView.delegate = forecastView
        forecastView.tableView.addSubview(refreshControl)
        
        registerCellForReuse()
        
        indicator = showActivityIndicatory(onView: self.view)
        requestCurrentLocation()
    }
    
    @objc func refresh(_ sender: UIRefreshControl) {
        self.requestCurrentLocation()
    }
    
    private func registerCellForReuse() {
        forecastView.tableView.register(DailyWeatherTableViewCell.nib, forCellReuseIdentifier: DailyWeatherTableViewCell.reuseIdentifier)
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
        weatherService.getWeeklyWeatherForecast(location: location).done { (weathers) in
            self.viewModel = ForecastViewModel(place: self.placemark!, forecast: weathers)
            self.viewModel?.configureTitleForNavigationBar(self.forecastView)
            self.forecastView.tableView.reloadData()
            }.ensure {
                self.refreshControl.endRefreshing()
                
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

extension ForecastViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection(section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.configureTitleForHeaderInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = forecastView.tableView.dequeueReusableCell(withIdentifier: DailyWeatherTableViewCell.reuseIdentifier, for: indexPath) as? DailyWeatherTableViewCell else { return self.tableView(tableView, cellForRowAt: indexPath); }
        
        viewModel?.configureDailyWeatherCell(cell, for: indexPath)
        cell.selectionStyle = .none
        
        return cell

    }
    
    
}
