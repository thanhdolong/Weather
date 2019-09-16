//
//  Theme.swift
//
//  Created by Thành Đỗ Long on 06/04/2019.
//  Copyright © 2019 Thành Đỗ Long. All rights reserved.
//  Theme class for creating standard UI elements for the app
//

import UIKit

protocol ThemeStrategy {
    var fonts: FontScheme {get}
    
    var barStyle: UIBarStyle { get }
    var keyboardAppearance: UIKeyboardAppearance { get }
}

protocol FontScheme {
    var headlineFont: UIFont {get}
    var subHeadlineFont: UIFont {get}
    
    var forecastHeadlineFont: UIFont {get}
    var forecastSubHeadlineFont: UIFont {get}
    var forecastTemperatureFont: UIFont {get}
    
    var bodyFont: UIFont {get}
    
    var tapBarFont: UIFont {get}
    var navigationBarFont: UIFont {get}
}
