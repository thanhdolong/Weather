//
//  TodayView.swift
//  Weather
//
//  Created by Thành Đỗ Long on 12/09/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//

import UIKit

public class TodayView: UIView {
    @IBOutlet weak var navigationBar: UINavigationBar!  {
        didSet {
            let attrs = [
                NSAttributedString.Key.foregroundColor: theme.colours.primaryTextColor,
                NSAttributedString.Key.font: theme.fonts.navigationBarFont
            ]
            
            navigationBar.titleTextAttributes = attrs
        }
    }
    
    @IBOutlet weak var weatherIconImage: UIImageView!
    
    @IBOutlet weak var curentLocationImage: UIImageView! {
        didSet {
            curentLocationImage.isHidden = true
        }
    }
    
    @IBOutlet weak var currentLocationLabel: UILabel! {
        didSet {
            currentLocationLabel.text = ""
            currentLocationLabel.font = theme.fonts.subHeadlineFont
            currentLocationLabel.textColor = theme.colours.primaryTextColor
        }
    }
    
    @IBOutlet weak var temperatureLabel: UILabel! {
        didSet {
            temperatureLabel.text = "---"
            temperatureLabel.font = theme.fonts.headlineFont
            temperatureLabel.textColor = theme.colours.secondaryTextColor
        }
    }
    
    @IBOutlet weak var humidityLabel: UILabel! {
        didSet {
            humidityLabel.text = "---"
            humidityLabel.font = theme.fonts.bodyFont
            humidityLabel.textColor = theme.colours.primaryTextColor
        }
    }
    
    @IBOutlet weak var precipitationLabel: UILabel! {
        didSet {
            precipitationLabel.text = "---"
            precipitationLabel.font = theme.fonts.bodyFont
            precipitationLabel.textColor = theme.colours.primaryTextColor
        }
    }
    
    @IBOutlet weak var pressureLabel: UILabel! {
        didSet {
            pressureLabel.text = "---"
            pressureLabel.font = theme.fonts.bodyFont
            pressureLabel.textColor = theme.colours.primaryTextColor
        }
    }
    
    @IBOutlet weak var windSpeedLabel: UILabel! {
        didSet {
            windSpeedLabel.text = "---"
            windSpeedLabel.font = theme.fonts.bodyFont
            windSpeedLabel.textColor = theme.colours.primaryTextColor
        }
    }
    
    @IBOutlet weak var windDirectionLabel: UILabel! {
        didSet {
            windDirectionLabel.text = "---"
            windDirectionLabel.font = theme.fonts.bodyFont
            windDirectionLabel.textColor = theme.colours.primaryTextColor
        }
    }
    
    @IBOutlet weak var shareButton: UIButton! {
        didSet {
            shareButton.setTitleColor(theme.colours.shareColor, for: .normal)
            shareButton.titleLabel?.font = theme.fonts.subHeadlineFont
        }
    }
    
}
