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
            let attrs = [
                NSAttributedString.Key.foregroundColor: theme.colours.primaryTextColor,
                NSAttributedString.Key.font: theme.fonts.navigationBarFont
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
        
        view.tintColor = .white

        
        let header = view as! UITableViewHeaderFooterView
        header.layer.borderWidth = 1
        header.layer.borderColor = theme.colours.borderColor.cgColor
        
        header.textLabel?.textColor = theme.colours.primaryTextColor
        header.textLabel?.font = theme.fonts.forecastHeadlineFont
    }
}
