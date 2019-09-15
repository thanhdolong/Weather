//
//  ForecastView.swift
//  Weather
//
//  Created by Thành Đỗ Long on 12/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit

public class ForecastView: UIView {
    @IBOutlet weak var navigationBar: UINavigationBar! {
        didSet {
            let attrs: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor(named: "primaryTextColor")!,
                .font: theme.fonts.navigationBarFont
            ]
            
            navigationBar.titleTextAttributes = attrs
            navigationBar.topItem?.title = "Forecast"
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.sectionHeaderHeight = 45
            tableView.tableFooterView = UIView()
        }
    }
}

extension ForecastView: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        view.tintColor = UIColor(named: "backgroundColor")

        
        let header = view as! UITableViewHeaderFooterView
        header.layer.borderWidth = 1
        header.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        
        header.textLabel?.textColor = UIColor(named: "primaryTextColor")
        header.textLabel?.font = theme.fonts.forecastHeadlineFont
    }
}
